//
//  ScanView.m
//  DemoCollection
//
//  Created by Jimmy on 24/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "ScanView.h"
#import "View+MASAdditions.h"

@interface ScanView()

@property (strong,nonatomic) UIImageView *scanLine;

@end

@implementation ScanView
{
    NSTimer *timer;
}

@synthesize scanLine;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setClipsToBounds:YES];
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    
    UIView *bgView = UIView.new;
    bgView.backgroundColor = [UIColor clearColor];
    [bgView.layer setMasksToBounds:YES];
    [bgView.layer setBorderWidth:1];
    [bgView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    UIImageView *topLeftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scanner_top_left"]];
    [self addSubview:topLeftView];
    [topLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(self);
        make.width.and.height.mas_lessThanOrEqualTo(self);
    }];
    
    UIImageView *topRightView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scanner_top_right"]];
    [self addSubview:topRightView];
    [topRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.mas_equalTo(self);
        make.width.and.height.mas_lessThanOrEqualTo(self);
    }];
    
    UIImageView *bottomLeftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scanner_bottom_left"]];
    [self addSubview:bottomLeftView];
    [bottomLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.mas_equalTo(self);
        make.width.and.height.mas_lessThanOrEqualTo(self);
    }];
    
    UIImageView *bottomRightView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scanner_bottom_right"]];
    [self addSubview:bottomRightView];
    [bottomRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.bottom.mas_equalTo(self);
        make.width.and.height.mas_lessThanOrEqualTo(self);
    }];
    
    scanLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scanner_line"]];
    [self addSubview:scanLine];
    [scanLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(self);
        make.width.and.height.mas_lessThanOrEqualTo(self);
    }];
}

- (void)startScan {
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(updateScanLine) userInfo:nil repeats:YES];
    [timer setFireDate:[NSDate date]];
}

- (void)stopScan {
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
}

- (void)updateScanLine {
    CGRect frame = scanLine.frame;
    frame.origin.y += 1;
    if (frame.origin.y > self.frame.size.height) {
        frame.origin.y = 0;
    }
    scanLine.frame = frame;
}

@end
