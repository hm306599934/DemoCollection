//
//  RuntimeVC.m
//  DemoCollection
//
//  Created by Jimmy on 28/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "RuntimeVC.h"
#import <objc/runtime.h>

@implementation RuntimeVC

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //关联函数
    [self associateFunction];
    
    //改变对象的类
    [self getObjectClass];
    
    //获取对象的类名
    [self getObjectClassName];
    
    //获取一个类的所有方法
    [self getClassMethods];
    
    //获取一个类的所有属性
    [self getClassProperty];
    
    //获取属性类型
    [self getPropertyType];
    
    //系统方法替换
    [self systemMethodExchange];
    
    //自定义方法替换
    [self selfMethodExchange];
    [self funcB];
    
    //自动归档和copy
    Jimmy *jim = [Jimmy new];
    jim.mAge = 12;
    jim.mName = @"lalala";
    NSData *jimmy = [NSKeyedArchiver archivedDataWithRootObject:jim];
    
    Jimmy *jim2 = [NSKeyedUnarchiver unarchiveObjectWithData:jimmy];
    int a = jim2.mAge;
    
    Jimmy *jim3 = [jim2 copy];
    
    //发送消息
    
    
    NSLog(@"end");
}

#pragma mark - 关联函数

- (void)associateFunction {
    UILabel *label = [UILabel new];
    NSString *string = @"dsadas";
    
    //关联
    objc_setAssociatedObject(label, @"AssociateKey", string, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //取值
    NSString *result = objc_getAssociatedObject(label, @"AssociateKey");
    //NSLog([NSString stringWithFormat:@"关联函数...%@",result]);
}

#pragma mark - 改变对象的类

- (void)getObjectClass {
    
    Jimmy *jimmy = [Jimmy new];
    //获取对象的类
    Class jimmyClass = object_getClass(jimmy);
    NSString *className = NSStringFromClass(jimmyClass);
    //NSLog([NSString stringWithFormat:@"获取对象的类...%@",className]);
    //设置对象的类
    
    Class otherClass = object_setClass(jimmy, [BoyFriend class]);
    jimmyClass = object_getClass(jimmy);
    className = NSStringFromClass(jimmyClass);
    //NSLog([NSString stringWithFormat:@"设置对象的类...%@",className]);
}

#pragma mark - 获取对象的类名

- (void)getObjectClassName {
    Jimmy *jimmy = [Jimmy new];
    NSString *className = [NSString stringWithCString:object_getClassName(jimmy) encoding:NSUTF8StringEncoding];
    //NSLog([NSString stringWithFormat:@"获取对象的类名...%@",className]);
}

#pragma mark - 获取一个类的所有方法

- (void)getClassMethods {
    u_int count;
    Method *method = class_copyMethodList([Jimmy class], &count);
    for (int i = 0; i < count; i++) {
        SEL name = method_getName(method[i]);
        NSString *strName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        //NSLog([NSString stringWithFormat:@"类的所有方法...%@",strName]);
    }
}

#pragma mark - 获取一个类的所有属性

- (void)getClassProperty {
    u_int count;
     objc_property_t *properties = class_copyPropertyList([Jimmy class], &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *strName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        //NSLog([NSString stringWithFormat:@"类的所有属性...%@",strName]);
    }
}

#pragma mark - 获取属性类型

- (void) getPropertyType {
    Jimmy *obj = [Jimmy new];
    Ivar var = class_getInstanceVariable(object_getClass(obj),"mName");
    const char* typeEncoding = ivar_getTypeEncoding(var);
    NSString *stringType =  [NSString stringWithCString:typeEncoding encoding:NSUTF8StringEncoding];
    
    if ([stringType hasPrefix:@"@"]) {
        // handle class case
        //NSLog(@"handle class case");
    } else if ([stringType hasPrefix:@"i"]) {
        // handle int case
        //NSLog(@"handle int case");
    } else if ([stringType hasPrefix:@"f"]) {
        // handle float case
        //NSLog(@"handle float case");
    } else
    {
        
    }
}

#pragma mark - 系统方法替换

- (void)systemMethodExchange {
    Method m1 = class_getInstanceMethod([NSString class],@selector(lowercaseString));
    Method m2 = class_getInstanceMethod([NSString class],@selector(uppercaseString));
    method_exchangeImplementations(m1, m2);
    //NSLog(@"系统方法替换...%@", [@"sssAAAAss"lowercaseString]);
    //NSLog(@"系统方法替换...%@", [@"sssAAAAss"uppercaseString]);
}

#pragma mark - 自定义方法替换

- (void)funcA {
    NSLog(@"自定义方法替换...the function A");
}

- (void)funcB {
    NSLog(@"自定义方法替换...the function B");
}

- (void)selfMethodExchange {
    Method method = class_getInstanceMethod([RuntimeVC class],@selector(funcA));
    IMP originalImp = method_getImplementation(method);
    Method m1 = class_getInstanceMethod([RuntimeVC class],@selector(funcB));
    method_setImplementation(m1, originalImp);
}



@end


@implementation BoyFriend : NSObject

@synthesize mName;
@synthesize mFriend;


@end

@implementation Jimmy : NSObject

@synthesize mName;
@synthesize mAge;

- (void)sayHello {
    NSLog([NSString stringWithFormat:@"hi ,my name is %@", mName]);
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    //未考虑C语言结构体
    u_int count;
    objc_property_t *properties = class_copyPropertyList([Jimmy class], &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *strName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        NSLog([NSString stringWithFormat:@"类的所有属性...%@",strName]);
        
        [aCoder encodeObject:[self valueForKey:strName] forKey:strName];
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    //未考虑C语言结构体
    if (self = [super init]) {
        u_int count;
        objc_property_t *properties = class_copyPropertyList([Jimmy class], &count);
        for (int i = 0; i < count; i++) {
            const char *propertyName = property_getName(properties[i]);
            NSString *strName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            NSLog([NSString stringWithFormat:@"类的所有属性...%@",strName]);
            
            [self setValue:[aDecoder decodeObjectForKey:strName] forKey:strName];
        }
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    //Jimmy *jimmy = [Jimmy new];
    Class jimmyClass = object_getClass(self);
    
    NSObject *jimmy = [jimmyClass new];
    
    u_int count;
    objc_property_t *properties = class_copyPropertyList(jimmyClass, &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *strName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        NSLog([NSString stringWithFormat:@"类的所有属性...%@",strName]);
        
        [jimmy setValue:[self valueForKey:strName] forKey:strName];
    }
    return jimmy;
}

@end