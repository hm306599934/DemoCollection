//
//  ProcessCircleView.m
//  DemoCollection
//
//  Created by Jimmy on 17/6/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "ProcessCircleView.h"

@implementation ProcessCircleView
{
    CGFloat mPercent;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.backgroundColor = [UIColor clearColor];
    mPercent = 0;
}

- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    CGFloat radius = self.frame.size.width / 2 - 10;
    CGFloat endAngle = 2 * M_PI * mPercent - M_PI / 2;

    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextBeginPath(contextRef);
    CGContextSetLineWidth(contextRef, 10.0);
    //画圆
    //CGContextMoveToPoint(contextRef, center.x, center.y);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor redColor].CGColor);
    CGContextAddArc(contextRef, center.x, center.y, radius, -M_PI / 2, endAngle, 0);
    CGContextSetFillColorWithColor(contextRef, [UIColor redColor].CGColor);
    CGContextDrawPath(contextRef, kCGPathStroke);
    
}

- (CGFloat)percent {
    return mPercent;
}

- (void)setPercent:(CGFloat)percent {
    mPercent = percent;
    [self setNeedsDisplay];
}

@end
