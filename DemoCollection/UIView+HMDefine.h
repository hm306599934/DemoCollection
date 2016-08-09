//
//  UIView+HMDefine.h
//  DemoCollection
//
//  Created by Jimmy on 25/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(HMFrame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@end


@interface UIView(HMView)

- (void)removeSubViews;

- (void)setBorderWidth:(CGFloat)width color:(UIColor*)color;

- (void)setBorderWidth:(CGFloat)width color:(UIColor*)color radius:(CGFloat)radius;

- (void)setRound;

- (void)setRadius:(CGFloat)radius;

@end