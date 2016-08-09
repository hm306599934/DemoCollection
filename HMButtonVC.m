//
//  HMButtonVC.m
//  DemoCollection
//
//  Created by Jimmy on 9/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HMButtonVC.h"
#import "HMButton.h"

@implementation HMButtonVC
@synthesize mButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickButton:(HMButton *)sender {
    [sender startCountDown:10];
}

@end
