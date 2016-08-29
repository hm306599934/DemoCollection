//
//  HMViewVC.m
//  DemoCollection
//
//  Created by Jimmy on 9/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HMViewVC.h"
#import "HMButton.h"
#import "HMTextInputView.h"
#import "UIView+HMDefine.h"

@interface HMViewVC()

@property (weak, nonatomic) IBOutlet HMTextInputView *mInputView;


@end

@implementation HMViewVC
@synthesize mInputView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [mInputView setBorderWidth:1 color:[UIColor lightGrayColor]];
    mInputView.mode = TextInputViewModePassswordVisible;
    mInputView.title = @"dadasd";
}

- (IBAction)doHMButton:(HMButton *)sender {
    [sender startCountDown:60];
}

@end
