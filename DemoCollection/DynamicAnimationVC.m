//
//  DynamicAnimationVC.m
//  DemoCollection
//
//  Created by Jimmy on 1/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "DynamicAnimationVC.h"

@implementation DynamicAnimationVC
{
    UIDynamicAnimator *animator;
    UIView *view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognized:)]];
}

- (void)tapRecognized:(UIGestureRecognizer*)recognizer {
    CGPoint tapPoint = [recognizer locationInView:self.view];
    
    //重力
//    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[view]];
//    gravity.gravityDirection = direction;
//    
//    gravity = [[UIGravityBehavior alloc] initWithItems:@[view]];
//    CGVector direction = CGVectorMake((tapPoint.x - view.center.x)
//                                      / (view.frame.size.width / 2),
//                                      (tapPoint.y - view.center.y)
//                                      / (view.frame.size.height / 2));
//    gravity.gravityDirection = direction;//方向
//    gravity.magnitude = 0.5;//速度
//    [animator addBehavior:gravity];
    
    //碰撞
//    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc]
//                                              initWithItems:@[view]];
//    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
//    [collisionBehavior addBoundaryWithIdentifier:@"lalala" forPath:[UIBezierPath bezierPathWithRect:CGRectMake(0, 400, 320, 100)]];
//    [animator addBehavior:collisionBehavior];
    
    //跟随
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 400, 50, 50)];
//    [self.view addSubview:view2];
//    view2.backgroundColor = [UIColor greenColor];
//    
//    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:view attachedToItem:view2];
//    
//    [animator addBehavior:attachment];
    
    //弹簧
//    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:view snapToPoint:tapPoint];
//    snap.damping = 0.1;
//    [animator addBehavior:snap];
    
    //推力
//    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[view] mode:UIPushBehaviorModeContinuous];
//    CGVector direction = CGVectorMake((tapPoint.x - view.center.x)
//                                      / (view.frame.size.width / 2),
//                                      (tapPoint.y - view.center.y)
//                                      / (view.frame.size.height / 2));
//    push.pushDirection = direction;//方向
//    push.magnitude = 0.5;//速度
//    [animator addBehavior:push];
    
}

@end
