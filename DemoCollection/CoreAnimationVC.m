//
//  CoreAnimationVC.m
//  DemoCollection
//
//  Created by Jimmy on 1/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "CoreAnimationVC.h"

#define kAngleToRadion(angle) ((angle) / 180.0 * M_PI)

@implementation CoreAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CAShapeLayer *lineLayer = [CAShapeLayer new];
    lineLayer.frame = CGRectMake(100, 100, 50, 50);
    lineLayer.backgroundColor = [UIColor redColor].CGColor;
//    lineLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 150) radius:100 startAngle:((CGFloat)-M_PI) endAngle:((CGFloat)M_PI) clockwise:NO].CGPath;
    lineLayer.fillColor = [UIColor blackColor].CGColor;
    lineLayer.strokeColor = [UIColor redColor].CGColor;
    lineLayer.lineWidth = 50;
    lineLayer.strokeEnd = 0.1;
    lineLayer.anchorPoint = CGPointMake(1.0, 0.0);

    [self.view.layer addSublayer:lineLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.repeatCount = HUGE_VALF;
    animation.duration = 5;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = @(312 * M_PI / 180);
    animation.byValue = @(2 * M_PI);
    
    
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        
        [lineLayer addAnimation:animation forKey:@"SecondAnimationKey"];
    });
}



@end
