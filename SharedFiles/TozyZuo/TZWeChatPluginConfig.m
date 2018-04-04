//
//  TZWeChatPluginConfig.m
//  WeChatDylib
//
//  Created by TozyZuo on 2018/3/29.
//  Copyright © 2018年 TozyZuo. All rights reserved.
//

#import "TZWeChatPluginConfig.h"
#import <objc/runtime.h>
#import <objc/message.h>

static NSString *TZUserDefaultsKeyPrefix;

@interface NSObject (TZWeChatPlugin)
@property (readonly) NSArray *ignoreProperties;
@end
@implementation NSObject (TZWeChatPlugin)
- (NSArray *)ignoreProperties
{
    return nil;
}
@end

@interface TZObjectInfo : NSObject
@property (nonatomic, strong) NSArray *propertyNames;
@property (nonatomic, strong) NSDictionary *classTypeMap;
- (instancetype)initWithObject:(NSObject *)object;
- (NSString *)classStringForProperty:(NSString *)property;
@end

@implementation TZObjectInfo

- (instancetype)initWithObject:(NSObject *)object
{
    if (self = [super init]) {

        NSMutableArray *propertyNames = [[NSMutableArray alloc] init];
        NSMutableDictionary *classTypeMap = [[NSMutableDictionary alloc] init];

        Class class = object.class;

        while (class != [NSObject class]) {

            objc_property_t *pList;
            unsigned count;
            pList = class_copyPropertyList(class, &count);

            for (int i = 0; i < count; i++) {

                objc_property_t p = pList[i];

                if ([object.ignoreProperties containsObject:@(property_getName(p))]) {
                    continue;
                }

                // propertyName
                NSString *propertyName = [NSString stringWithUTF8String:property_getName(p)];
                [propertyNames addObject:propertyName];

                // class map
                unsigned count;
                objc_property_attribute_t *attributes = property_copyAttributeList(p, &count);
                for (int i = 0; i < count; i++) {
                    if ([@(attributes[i].name) isEqualToString:@"T"]) {
                        NSString *classString = @(attributes[i].value);
                        if ([classString hasPrefix:@"@"]) {
                            classString = [classString substringWithRange:NSMakeRange(2, classString.length - 3)];
                        }
                        classTypeMap[propertyName] = classString;
                    }
                }
                free(attributes);
            }
            free(pList);
            class = class_getSuperclass(class);
        }
        self.propertyNames = propertyNames.reverseObjectEnumerator.allObjects.mutableCopy;
        self.classTypeMap = classTypeMap;
    }
    return self;
}

- (NSString *)classStringForProperty:(NSString *)property
{
    return self.classTypeMap[property];
}

@end

@interface TZWeChatPluginConfig ()
@property (nonatomic, strong) TZObjectInfo *info;
@property (nonatomic, strong) NSDictionary *dispathMap;
@end
@implementation TZWeChatPluginConfig

+ (instancetype)sharedConfig
{
    static TZWeChatPluginConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[TZWeChatPluginConfig alloc] init];
    });
    return config;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        TZUserDefaultsKeyPrefix = NSStringFromClass(self.class);
        self.info = [[TZObjectInfo alloc] initWithObject:self];
        self.dispathMap = @{@"B": NSStringFromSelector(@selector(handleBOOLInvocation:))};

        for (NSString *property in self.info.propertyNames) {
            [self setValue:[[NSUserDefaults standardUserDefaults] objectForKey:[TZUserDefaultsKeyPrefix stringByAppendingString:property]] forKey:property];
            [self addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew context:NULL];
        }

    }
    return self;
}

- (NSArray *)ignoreProperties
{
    return @[@"info", @"dispathMap"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    [[NSUserDefaults standardUserDefaults] setObject:[self valueForKey:keyPath] forKey:[TZUserDefaultsKeyPrefix stringByAppendingString:keyPath]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)propertyFromSelector:(SEL)sel
{
    NSString *selector = NSStringFromSelector(sel);
    if ([selector containsString:TZUserDefaultsKeyPrefix]) {
        return [selector substringToIndex:selector.length - TZUserDefaultsKeyPrefix.length - 1];
    }
    return nil;
}

- (SEL)selectorForPropertySEL:(SEL)propertySEL
{
    NSString *selector = NSStringFromSelector(propertySEL);
    if (![selector containsString:TZUserDefaultsKeyPrefix]) {
        selector = [NSStringFromSelector(propertySEL) stringByAppendingFormat:@"%@:", TZUserDefaultsKeyPrefix];
    }
    return NSSelectorFromString(selector);
}

- (void)setNilValueForKey:(NSString *)key
{
    // 防止初始化崩溃
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel containsString:TZUserDefaultsKeyPrefix]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSString *sel = self.dispathMap[[self.info classStringForProperty:[self propertyFromSelector:anInvocation.selector]]];
    if (sel) {
        [self performSelector:NSSelectorFromString(sel) withObject:anInvocation];
    }
}

- (void)handleBOOLInvocation:(NSInvocation *)anInvocation
{
    void *rawValue;
    [anInvocation getArgument:&rawValue atIndex:2];

    UISwitch *swich = (__bridge UISwitch *)rawValue;
    [self setValue:@(swich.on) forKey:[self propertyFromSelector:anInvocation.selector]];
}

@end
