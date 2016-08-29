//
//  VideoPlayViewController.m
//  DemoCollection
//
//  Created by Jimmy on 25/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "VideoPlayViewController.h"
#import "HMVideoPlayerViewController.h"

@interface VideoPlayViewController()

@property(nonatomic, strong) HMVideoPlayerViewController *videoVPlayerVC;

@end

@implementation VideoPlayViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:self.videoVPlayerVC];
    [self.view addSubview:self.videoVPlayerVC.view];
}

- (HMVideoPlayerViewController *)videoVPlayerVC {
    if (_videoVPlayerVC == nil) {
        _videoVPlayerVC = [HMVideoPlayerViewController new];
    }
    return _videoVPlayerVC;
}

@end
