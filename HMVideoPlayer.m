//
//  HMVideoPlayer.m
//  DemoCollection
//
//  Created by Jimmy on 25/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HMVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface HMVideoPlayer()
//播放器
@property(nonatomic, strong) AVPlayer *player;

@end

@implementation HMVideoPlayer
{
    AVPlayerItem *currentPlayerItem;
}

//重写改变层，是为了把player加到layer上
+ (Class)layerClass {
    return [AVPlayerLayer class];
}

#pragma mark - 初始化

- (instancetype)init {
    if (self = [super init]) {
        [self initial];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)initial {
    //让子控件不要越界
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor blackColor];
    
    NSString *urlString = [[NSBundle mainBundle] pathForResource:@"1.mp4" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:urlString];
    //创建playerItem
    currentPlayerItem = [AVPlayerItem playerItemWithURL:url];
    //添加item的观察者 监听播放源的播放状态(status)
 
    //创建playerItem
    [self.player replaceCurrentItemWithPlayerItem:currentPlayerItem];
    [self.player play];
    
    
    __weak __typeof(self) weakSelf = self;
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        //当前播放的时间
        NSTimeInterval current = CMTimeGetSeconds(time);
        //视频的总时间
        NSTimeInterval total = CMTimeGetSeconds(weakSelf.player.currentItem.duration);
        //设置滑块的当前进度
        NSLog(@"%f", current / total);
    }];
}

- (AVPlayer *)player {
    if (_player == nil) {
        _player = [AVPlayer new];
        AVPlayerLayer *layer = (AVPlayerLayer*)[self layer];
        [layer setPlayer:_player];
        layer.frame = self.bounds;
        layer.videoGravity = AVLayerVideoGravityResize;
    }
    return _player;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"status"]) {
        
        if (playerItem.status == AVPlayerStatusReadyToPlay) {
            NSLog(@"ssssssssssss");
        } else if (playerItem.status == AVPlayerStatusFailed) {
            NSLog(@"sssssssdddddddddd");
        }
    } else if ([keyPath isEqualToString:@"error"]) {
        NSLog(@"aaaaaaaaaaaaaa");
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        
        
    }
}

- (void)setCurrentPlayerItem:(NSURL*)url {
    //视频加载状态
    [currentPlayerItem removeObserver:self forKeyPath:@"status"];
    //视频加载进度
    [currentPlayerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    //加载错误码
    [currentPlayerItem removeObserver:self forKeyPath:@"error"];
    
    currentPlayerItem = [[AVPlayerItem alloc]initWithURL:url];
    
    [currentPlayerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [currentPlayerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    [currentPlayerItem addObserver:self forKeyPath:@"error" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.player replaceCurrentItemWithPlayerItem:currentPlayerItem];
}

- (void)dealloc {
    //[currentPlayerItem removeObserver:self forKeyPath:@"status"];
    //[currentPlayerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    //[currentPlayerItem removeObserver:self forKeyPath:@"error"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
