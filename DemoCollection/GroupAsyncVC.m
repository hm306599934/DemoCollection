//
//  AsyncTasksVC.m
//  DemoCollection
//
//  Created by Jimmy on 17/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "GroupAsyncVC.h"

@interface GroupAsyncVC ()

@end

@implementation GroupAsyncVC
@synthesize mImageView1, mImageView2, mImageView3, mImageView4;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t  group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        NSURL *url = [NSURL URLWithString: @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSThread sleepForTimeInterval:1];
                self.mImageView1.image = image;
            });
        }
    });
    
    dispatch_group_async(group, queue, ^{
        NSURL *url = [NSURL URLWithString: @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSThread sleepForTimeInterval:1];
                self.mImageView2.image = image;
            });
        }
    });
    
    dispatch_group_async(group, queue, ^{
        NSURL *url = [NSURL URLWithString: @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSThread sleepForTimeInterval:1];
                self.mImageView3.image = image;
            });
        }
    });
    
    dispatch_group_async(group, queue, ^{
        NSURL *url = [NSURL URLWithString: @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSThread sleepForTimeInterval:1];
                self.mImageView4.image = image;
            });
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [[[UIAlertView alloc]initWithTitle:nil message:@"complete" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
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
