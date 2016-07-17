//
//  OtherVC.m
//  DemoCollection
//
//  Created by Jimmy on 19/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "OtherVC.h"

@interface OtherVC ()

@end

@implementation OtherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 100, 100)];
    textField.text = @"dsadas";
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
