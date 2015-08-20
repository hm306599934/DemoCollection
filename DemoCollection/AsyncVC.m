//
//  AsyncVC.m
//  DemoCollection
//
//  Created by trier on 17/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "AsyncVC.h"

@interface AsyncVC ()

@end

@implementation AsyncVC
@synthesize mImageView;

- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString: @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.mImageView.image = image;
            });
        }
    });
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
