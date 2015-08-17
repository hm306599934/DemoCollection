//
//  GCDVC.m
//  DemoCollection
//
//  Created by trier on 17/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import "GCDVC.h"

@interface GCDVC ()

@end

@implementation GCDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)doAsyncTask:(id)sender {
    [self performSegueWithIdentifier: @"Async" sender:nil];
}

- (IBAction)doGroupAsync:(id)sender {
     [self performSegueWithIdentifier: @"GroupAsync" sender:nil];
}

- (IBAction)doBarrierAsync:(id)sender {
    [self performSegueWithIdentifier: @"BarrierAsync"  sender:nil];
}

@end
