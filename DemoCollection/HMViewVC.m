//
//  HMViewVC.m
//  DemoCollection
//
//  Created by Jimmy on 9/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HMViewVC.h"
#import "HMButton.h"
#import "HMInputView.h"

@interface HMViewVC()

@property (weak, nonatomic) IBOutlet HMInputView *mInputView;


@end

@implementation HMViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)doHMButton:(HMButton *)sender {
    [sender startCountDown:60];
}

@end
