//
//  AlipayVC.m
//  DemoCollection
//
//  Created by Jimmy on 21/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "AlipayVC.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation AlipayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[AlipaySDK defaultService] payOrder:@"dad" fromScheme:@"alipay12321213" callback:^(NSDictionary *resultDic) {
        //【callback处理支付结果】
        NSLog(@"reslut = %@",resultDic);
    }];
}

@end
