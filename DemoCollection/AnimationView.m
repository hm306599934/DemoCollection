
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
    AnimationType animationType;
    int angle;
    UIView *animationView;
}

- (id)initWithFrame: (CGRect)frame in:(UIView*)view type:(AnimationType)type {
    self = [super initWithFrame:frame];
    if (self) {
        superView = view;
        animationType = type;
        angle = 0;
        animationView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 10, self.frame.size.height / 2- 60, 20, 20)];
        animationView.backgroundColor = [UIColor redColor];
        [self addSubview:animationView];
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.7];
    }
    return self;
}

- (void)show {
    [superView addSubview:self];
    [self startAnimation: animationType];
}

-(void)dismiss {
    [self removeFromSuperview];
}

- (void)startAnimation:(AnimationType)type {
    if (type == AnimationMove) {
        [self move];
    }else if (type == AnimationRotate) {
        [self rotate];
    }else if (type == AnimationBigger) {
        [self bigger];
    }else if (type == AnimationFadeIn) {
        [self fadeIn];
    }else if (type == AnimationFadeOut) {
        [self fadeOut];
    }
}

- (void)move {
    [UIView animateWithDuration:3 animations:^{
        animationView.frame = CGRectMake(self.frame.size.width , self.frame.size.height -44, 20, 20);
    } completion:^(BOOL finished) {
        if (finished) {
            [self dismiss];
        }
    }];
}

- (void)rotate{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self rotate1];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        [self rotate2];
    });
}


- (void)rotate1 {
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(angle * (M_PI / 360.0f));
    [UIView animateWithDuration:0.01 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{        animationView.transform = endAngle;
    } completion:^(BOOL finished) {
        angle += 10;
        if (angle < 360 * 3) {
            [self rotate1];
        }else {
            [self dismiss];
            animationView.transform = CGAffineTransformMakeRotation(0 * (M_PI / 360.0f));
        }
    }];
}

- (void)rotate2 {
    UIImageView *arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 40, self.frame.size.height / 2 + 50, 80, 100)];
    arrowView.image = [UIImage imageNamed: @"image_arrow"];
    [self addSubview:arrowView];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.fromValue =  @(-M_PI_2);
    animation.toValue  = @(M_PI_2);
    animation.duration  = 2.2f;
    animation.repeatCount = 0;
    [arrowView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}

- (void)bigger {
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        animationView.frame = self.frame ;
    } completion:^(BOOL finished) {
        if (finished) {
            [self dismiss];
        }
    }];
}

- (void)fadeIn{
    animationView.alpha = 0;
    animationView.frame = CGRectMake(self.frame.size.width / 2 - 10, self.frame.size.height / 2- 60, 0, 0);
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        animationView.alpha = 1;
        animationView.frame = CGRectMake(self.frame.size.width / 2 - 20, self.frame.size.height / 2- 70, 20, 20);
    } completion:^(BOOL finished) {
        if (finished) {
            [self dismiss];
        }
    }];
}

- (void)fadeOut {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        animationView.alpha = 0;
        animationView.frame = CGRectMake(self.frame.size.width / 2, self.frame.size.height / 2- 50, 0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            [self dismiss];
        }
    }];
}

@end
