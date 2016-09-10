//
//  NSThreadVC.m
//  DemoCollection
//
//  Created by Jimmy on 9/9/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "NSThreadVC.h"

@implementation NSThreadVC
//http://www.jianshu.com/p/334bde6790be
- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSThread * newThread = [[NSThread alloc]initWithTarget:self selector:@selector(test) object:nil];
    
    [newThread start];
}

- (void)test {
    NSLog(@"");
}

@end
