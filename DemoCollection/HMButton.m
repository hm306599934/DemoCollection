//
//  HMButton.m
//  DemoCollection
//
//  Created by Jimmy on 9/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HMButton.h"

@implementation HMButton
{
    dispatch_source_t timer;
    NSString *mTitle;
}

- (void)startCountDown:(int)timeOut {
    __block int leftTime = timeOut;
    self.enabled = NO;
    mTitle = self.currentTitle;
    
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    
    dispatch_source_set_timer(timer,dispatch_walltime(nil, 0),NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if (leftTime == 1) {
            [self stopCountDown];
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *string = [NSString stringWithFormat:@"(%d)", leftTime];
                self.titleLabel.text = string;
                [self setTitle:string forState:UIControlStateNormal];
            });
        }
        leftTime--;
    });
    
    dispatch_source_set_cancel_handler(timer, ^{
    
    });
    dispatch_resume(timer);
}

- (void)stopCountDown {
    self.enabled = YES;
    dispatch_source_cancel(timer);
    dispatch_async(dispatch_get_main_queue(), ^{
        //设置界面的按钮显示 根据自己需求设置
        NSString *string = mTitle;
        self.titleLabel.text = string;
        [self setTitle:string forState:UIControlStateNormal];
    });
}

@end
