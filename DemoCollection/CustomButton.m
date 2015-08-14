//
//  CustomButton.m
//  DemoCollection
//
//  Created by trier on 14/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import "CustomButton.h"
#import "UIView+Helper.h"

@implementation CustomButton

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addBorder:3];
}

@end
