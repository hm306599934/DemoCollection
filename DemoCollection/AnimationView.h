//
//  AnimationView.h
//  DemoCollection
//
//  Created by trier on 18/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    AnimationMove,
    AnimationRotate,
    AnimationBigger,
    AnimationFadeIn,
    AnimationFadeOut
} AnimationType;

@interface AnimationView : UIView

-(id)initWithFrame: (CGRect)frame in:(UIView*)view type:(AnimationType)type;
-(void)show;
-(void)dismiss;

@end