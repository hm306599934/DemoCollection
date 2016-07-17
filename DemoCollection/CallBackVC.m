//
//  FirstVC.m
//  DemoCollection
//
//  Created by Jimmy on 13/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "CallBackVC.h"
#import "BlockVC.h"
#import "UIView+Helper.h"

@implementation CallBackVC
@synthesize btnBlock;
@synthesize btnDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES; //自动滑动返回
    [self.btnDelegate addBorder:5];
    [self.btnBlock addBorder:5];
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

- (IBAction)doDelegate:(UIButton *)sender {
    [self performSegueWithIdentifier:@"Delegate" sender:nil];
}

- (IBAction)doBlock:(UIButton *)sender {
    [self performSegueWithIdentifier:@"Block" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Delegate"]) {
        DelegateVC *vc = (DelegateVC *)segue.destinationViewController;
        vc.delegate = self;
    }else if ([segue.identifier isEqualToString:@"Block"]) {
        BlockVC *vc = (BlockVC *)segue.destinationViewController;
        [vc initBlock:^{
             [[[UIAlertView alloc] initWithTitle:nil message: @"delegate success" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }];
    }
}

- (void)testDelegate {
    [[[UIAlertView alloc] initWithTitle:nil message: @"delegate success" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

@end
