//
//  UIView+Helper.h
//  DemoCollection
//
//  Created by Jimmy on 14/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

@import UIKit;
@import QuartzCore;

@interface UIView(Helper)

- (void)addBorder:(CGFloat)radius colour:(UIColor *)color width:(CGFloat)width;
- (void)addBorder:(CGFloat)radius;
- (void)round;
- (void)addRadius:(CGFloat)radius;

@end
