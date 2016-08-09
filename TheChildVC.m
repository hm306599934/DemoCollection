//
//  TheChildVC.m
//  DemoCollection
//
//  Created by Jimmy on 1/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "TheChildVC.h"
#import "View+MASAdditions.h"

@implementation TheChildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = UIView.new;
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view).mas_offset(-55);
        make.width.and.height.mas_equalTo(50);
    }];
}

@end
