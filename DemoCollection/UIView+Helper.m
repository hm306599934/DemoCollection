//
//  UIView+Helper.m
//  DemoCollection
//
//  Created by trier on 14/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
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

- (void)round {
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.layer.masksToBounds = YES;
}

- (void)addRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

@end
