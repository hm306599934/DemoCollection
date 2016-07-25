//
//  ScanBackgroundView.m
//  DemoCollection
//
//  Created by Jimmy on 24/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "ScanBackgroundView.h"
#import "View+MASAdditions.h"

@implementation ScanBackgroundView
@synthesize mContentView;

- (void)setMContentView:(UIView *)contentView {
    mContentView = contentView;
    [self setUpView];
}

- (void)setUpView {
    
    UIView *topView = UIView.new;
    topView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(self);
        make.bottom.mas_equalTo(mContentView.mas_top);
    }];
    
    UIView *bottomView = UIView.new;
    bottomView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(self);
        make.top.mas_equalTo(mContentView.mas_bottom);
    }];
    
    UIView *leftView = UIView.new;
    leftView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [self addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(mContentView.mas_left);
        make.top.mas_equalTo(topView.mas_bottom);
        make.bottom.mas_equalTo(bottomView.mas_top);
    }];
    
    UIView *rightView = UIView.new;
    rightView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [self addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mContentView.mas_right);
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(topView.mas_bottom);
        make.bottom.mas_equalTo(bottomView.mas_top);
    }];
    

}

@end
