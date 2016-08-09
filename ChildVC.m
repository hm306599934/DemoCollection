//
//  ChildVC.m
//  DemoCollection
//
//  Created by Jimmy on 1/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "ChildVC.h"
#import "TheChildVC.h"

@interface ChildVC()

@property(nonatomic, strong) TheChildVC *theChildVC;

@end

@implementation ChildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.theChildVC.view];
    [self addChildViewController:self.theChildVC];
    
}

- (TheChildVC *)theChildVC {
    if (_theChildVC == nil) {
        _theChildVC = TheChildVC.new;
    }
    return _theChildVC;
}

@end
