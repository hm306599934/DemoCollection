//
//  UIView+Helper.m
//  DemoCollection
//
//  Created by trier on 14/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView(Helper)

- (void)addBorder:(CGFloat)radius colour:(UIColor *)color width:(CGFloat)width {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)addBorder:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

@end
