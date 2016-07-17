


//
//  CustomPickerView.m
//  DemoCollection
//
//  Created by Jimmy on 21/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "CustomPickerView.h"
#define mDuration 0.6   //弹出时间

@implementation CustomPickerView
@synthesize mView;

- (id)initWithTitle:(NSString *)title delegate:(id)delegate {
    self = [[[NSBundle mainBundle] loadNibNamed:@"CustomSelect" owner:self options:nil] objectAtIndex:0];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)showInView:(UIView *)view {
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = mDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    [self setAlpha:1.0f];
    [mView.layer addAnimation:animation forKey:@"CustomPickerView"];
    self.frame = CGRectMake(0, 0, view.frame.size.width,view.frame.size.height);
    
    [view addSubview:self];
}

@end
