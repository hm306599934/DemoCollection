//
//  BarrierAsyncVC.m
//  DemoCollection
//
//  Created by trier on 17/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "BarrierAsyncVC.h"

@interface BarrierAsyncVC ()

@end

@implementation BarrierAsyncVC
@synthesize mImageView1, mImageVIew2, mImageView3, mIamgeView4;

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_queue_t queue = dispatch_queue_create("dd", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
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
    
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString: @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSThread sleepForTimeInterval:2];
                self.mImageVIew2.image = image;
            });
        }
    });

    //之前完成才开始，完成之后之后才开始
    dispatch_barrier_async(queue, ^{
        NSURL *url = [NSURL URLWithString: @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSThread sleepForTimeInterval:2];
                self.mImageView3.image = image;
            });
        }
    });

    
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString: @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSThread sleepForTimeInterval:1];
                self.mIamgeView4.image = image;
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
