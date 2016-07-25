//
//  MasonryVC.m
//  DemoCollection
//
//  Created by Jimmy on 23/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "MasonryVC.h"
#import "View+MASAdditions.h"

@implementation MasonryVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *viewRed = [UIView new];
    viewRed.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:viewRed];
    
    UIView *viewGray = [UIView new];
    viewGray.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:viewGray];
    
    UIView *viewBlue = [UIView new];
    viewBlue.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:viewBlue];
    
    UIView *viewYellow = [UIView new];
    viewYellow.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:viewYellow];
    
    UIView *viewPurple = [UIView new];
    viewPurple.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:viewPurple];
    
    UIView *viewGreen = [UIView new];
    viewGreen.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:viewGreen];
    //左上角
    [viewRed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(64);
        make.left.equalTo(self.view.mas_left);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    //居中
    [viewGray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.and.height.mas_equalTo(100);
    }];
    //灰块上方
    [viewBlue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(viewGray.mas_left);
        make.bottom.mas_equalTo(viewGray.mas_top);
        make.top.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    //灰块左边
    [viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(viewRed.mas_bottom);
        make.right.mas_equalTo(viewGray.mas_left);
    }];
    //灰块左上
    [viewPurple mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(viewGray);
        //缩放
        make.width.mas_equalTo(viewGray).multipliedBy(0.3333333);
        make.height.mas_equalTo(viewGray).dividedBy(3);
    }];
}


@end
