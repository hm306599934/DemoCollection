//
//  AnimationView.h
//  DemoCollection
//
//  Created by Jimmy on 18/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    AnimationMove,
    AnimationRotate,
    AnimationBigger,
    AnimationFadeIn,
    AnimationFadeOut,
    AnimationFrame,
    AnimationBounds,
    AnimationCenter,
    AnimationTransform,
    AnimationAlpha,
    AnimationBackgroundColor,
} AnimationType;

@interface AnimationView : UIView

-(id)initWithFrame: (CGRect)frame in:(UIView*)view type:(AnimationType)type;
-(void)show;
-(void)dismiss;

@end
