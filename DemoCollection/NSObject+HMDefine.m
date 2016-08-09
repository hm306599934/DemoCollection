//
//  NSObject+HMDefine.m
//  DemoCollection
//
//  Created by Jimmy on 3/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "NSObject+HMDefine.h"
#import <objc/runtime.h>

@implementation NSObject(RunTime)

- (Class)getClass {
    return object_getClass(self);
}

- (NSString *)getClassName {
    NSString *className = [NSString stringWithCString:object_getClassName(self) encoding:NSUTF8StringEncoding];
    return className;
}

- (NSArray *)getPropertyName {
    NSMutableArray *result = [NSMutableArray new];
    
    u_int count;
    Method *method = class_copyMethodList([self class], &count);
    for (int i = 0; i < count; i++) {
        SEL name = method_getName(method[i]);
        NSString *strName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        [result addObject:strName];
    }
    
    return result;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    //未考虑C语言结构体
    u_int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *strName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        
        [aCoder encodeObject:[self valueForKey:strName] forKey:strName];
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    //未考虑C语言结构体
    if (self = [self init]) {
        u_int count;
        objc_property_t *properties = class_copyPropertyList([self class], &count);
        for (int i = 0; i < count; i++) {
            const char *propertyName = property_getName(properties[i]);
            NSString *strName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            
            [self setValue:[aDecoder decodeObjectForKey:strName] forKey:strName];
        }
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    Class myClass = object_getClass(self);
    
    NSObject *jimmy = [myClass new];
    
    u_int count;
    objc_property_t *properties = class_copyPropertyList(myClass, &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *strName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        
        [jimmy setValue:[self valueForKey:strName] forKey:strName];
    }
    return jimmy;
}

@end
