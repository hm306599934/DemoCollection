
//
//  AnimationView.m
//  DemoCollection
//
//  Created by trier on 18/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView
{
    UIView *superView;
}

-(id)initWithFrame: (CGRect)frame in:(UIView*)view {
    self = [super initWithFrame:frame];
    if (self) {
        superView = view;
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)show {
    [superView addSubview:self];
    [self startAnimation];
}

-(void)dismiss {
    [self removeFromSuperview];
}

-(void)startAnimation {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    view.backgroundColor = [UIColor redColor];
    [UIView animateWithDuration:3 animations:^{
        CGAffineTransform newTransform = CGAffineTransformMakeScale(1.2, 1.2);
        [view setTransform:newTransform];
    } completion:^(BOOL finished) {
        if (finished){
            [self dismiss];
        }
    }];
}

@end
