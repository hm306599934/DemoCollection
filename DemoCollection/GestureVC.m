

//
//  GestureVC.m
//  DemoCollection
//
//  Created by Tony on 8/23/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import "GestureVC.h"

@implementation GestureVC
{
    CGPoint startLocation;
}
@synthesize mView;

- (void)viewDidLoad {
    [super viewDidLoad];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        [mView addGestureRecognizer:pan];
    
    
    
//    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
//    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
//    [mView addGestureRecognizer:swipeDown];
//    UISwipeGestureRecognizer *swipeRightDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
//    [swipeRightDown setDirection:UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionRight];
//    [mView addGestureRecognizer:swipeRightDown];
}

-(void)swipe:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"down");
    }else if(recognizer.direction == (UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionRight)) {
        NSLog(@"rightdown");
    }
}

- (void)panGesture:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        startLocation = [sender locationInView:self.view];
    }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint stopLocation = [sender locationInView:self.view];
        CGFloat dx = stopLocation.x - startLocation.x;
        CGFloat dy = stopLocation.y - startLocation.y;
        CGFloat distance = sqrt(dx*dx + dy*dy );
        NSLog(@"Distance: %f", distance);
    }
}

@end
