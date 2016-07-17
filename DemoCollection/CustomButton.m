//
//  CustomButton.m
//  DemoCollection
//
//  Created by Jimmy on 14/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "CustomButton.h"
#import "UIView+Helper.h"

@implementation CustomButton

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addBorder:3];
}

@end
