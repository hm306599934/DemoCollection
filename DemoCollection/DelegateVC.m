//
//  SecondVC.m
//  DemoCollection
//
//  Created by trier on 13/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import "DelegateVC.h"

@implementation DelegateVC
@synthesize delegate;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Submit:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if (delegate != nil) {
        [delegate testDelegate];
    }

}



@end