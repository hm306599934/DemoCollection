//
//  TestVC.m
//  DemoCollection
//
//  Created by Jimmy on 3/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "TestVC.h"
#import "NSObject+HMDefine.h"
#import "RuntimeVC.h"

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    //自动归档和copy
    Jimmy *jim = [Jimmy new];
    jim.mAge = 12;
    jim.mName = @"lalala";
    NSData *jimmy = [NSKeyedArchiver archivedDataWithRootObject:jim];
    
    Jimmy *jim2 = [NSKeyedUnarchiver unarchiveObjectWithData:jimmy];
    int a = jim2.mAge;
    
    Jimmy *jim3 = [jim2 copy];
    
    NSLog(@"end");
}

@end
