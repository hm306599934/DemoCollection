//
//  HMVideoPlayerViewController.m
//  DemoCollection
//
//  Created by Jimmy on 25/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HMVideoPlayerViewController.h"
#import "HMVideoPlayer.h"
#import "View+MASAdditions.h"

#define SCREEN_SIZE_WIDTH     MIN([[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)
#define SCREEN_SIZE_HEIGHT    MAX([[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)

@interface HMVideoPlayerViewController()

@property(nonatomic, strong) HMVideoPlayer *player;

@end

@implementation HMVideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.player];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addMasonry];
}


- (HMVideoPlayer *)player {
    if (_player == nil) {
        _player = HMVideoPlayer.new;
    }
    return _player;
}

- (void)addMasonry {
    
    [self.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0).mas_offset(64);
        make.width.mas_equalTo(SCREEN_SIZE_WIDTH);
        make.height.mas_equalTo(SCREEN_SIZE_WIDTH * 9 / 16);
    }];
    
    [self.player mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

@end
