//
//  ClassClusterVC.m
//  DemoCollection
//
//  Created by Jimmy on 30/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "ClassClusterVC.h"

@implementation ClassClusterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HMEmployee *doctor = [[HMEmployee alloc] initEmployeeWithType:EmplyeeTypeDoctor];
    [doctor work];
    
    HMEmployee *engineer = [[HMEmployee alloc] initEmployeeWithType:EmplyeeTypeEngineer];
    [engineer rest];
}

@end


@implementation HMEmployee

- (instancetype)initEmployeeWithType:(EmplyeeType)type {
    if (self = [super init]) {
        NSString *className;
        if (type == EmplyeeTypeEngineer) {
            className = @"HMEmployeeEngineer";
        } else if (type == EmplyeeTypeDoctor) {
            className = @"HMEmployeeDoctor";
        } else {
            className = @"HMEmployee";
        }
        
        Class class = NSClassFromString(className);
        self = [class new];
    }
    
    return self;
}

- (void)work {
    NSLog(@"start work");
}

- (void)rest {
    NSLog(@"start rest");
}

@end

@implementation HMEmployeeEngineer

- (void)work {
    NSLog(@"Engineer start work");
}

- (void)rest {
    NSLog(@"Engineer start rest");
}

@end

@implementation HMEmployeeDoctor

- (void)work {
    NSLog(@"Doctor start work");
}

- (void)rest {
    NSLog(@"Doctor start rest");
}

@end