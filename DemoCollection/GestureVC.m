

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
    CGPoint startPanPoint;
}
@synthesize mView;

- (void)viewDidLoad {
    [super viewDidLoad];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [mView addGestureRecognizer:pan];
}

-(void)swipe:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"down");
    }else if(recognizer.direction == (UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionRight)) {
        NSLog(@"rightdown");
    }
}


- (void)addArrowAnimation:(Direction)direction  transformFrom:(CGAffineTransform)from to:(CGAffineTransform)to{
    NSArray * array =  [[NSArray alloc] initWithObjects:@"image_arrow_up", @"image_arrow_down", @"image_arrow_left", @"image_arrow_right", @"image_arrow_leftup", @"image_arrow_leftdown", @"image_arrow_rightup", @"image_arrow_rightdown", nil];
    UIImage *image =  [UIImage imageNamed:[array objectAtIndex:direction]];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:[array objectAtIndex:direction]];
    CGFloat marginWidth = self.mView.frame.size.width / 4;
    CGFloat marginHeight= self.mView.frame.size.height / 7;
    switch (direction) {
        case DirectionUp:   //上
            imageView.frame = CGRectMake((mView.frame.size.width -  image.size.width) / 2, mView.frame.size.height / 2 -  image.size.height - marginHeight, image.size.width, image.size.height);
            break;
        case DirectionDown:     //下
            imageView.frame = CGRectMake((mView.frame.size.width -  image.size.width) / 2, mView.frame.size.height / 2 + marginHeight, image.size.width, image.size.height);
            break;
        case DirectionLeft:     //左
            imageView.frame = CGRectMake(mView.frame.size.width / 2 -  image.size.width - marginWidth, (mView.frame.size.height -  image.size.height) / 2, image.size.width, image.size.height);
            break;
        case DirectionRight:        //右
            imageView.frame = CGRectMake(mView.frame.size.width / 2 + marginWidth, (mView.frame.size.height -  image.size.height) / 2, image.size.width, image.size.height);
            break;
        case DirectionLeftUp:       //左上
            imageView.frame = CGRectMake(mView.frame.size.width / 2 -  image.size.width - marginWidth, mView.frame.size.height / 2 -  image.size.height - marginHeight, image.size.width, image.size.height);
            break;
        case DirectionLeftDown:     //左下
            imageView.frame = CGRectMake(mView.frame.size.width / 2 -  image.size.width - marginWidth, mView.frame.size.height / 2 + marginHeight, image.size.width, image.size.height);
            break;
        case DirectionRightUp:      //右上
            imageView.frame = CGRectMake(mView.frame.size.width / 2 + marginWidth, mView.frame.size.height / 2 -  image.size.height - marginHeight, image.size.width, image.size.height);
            break;
        case DirectionRightDown:        //右下
            imageView.frame = CGRectMake(mView.frame.size.width / 2 + marginWidth, mView.frame.size.height / 2  + marginHeight, image.size.width, image.size.height);
            break;
        default:
            break;
    }
    
    [mView addSubview:imageView];
    imageView.transform = from;
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:1.5];
        imageView.transform = to;
    } completion:^(BOOL finished){
        if(finished){
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                imageView.alpha = 0;
            } completion:^(BOOL finished){
                if(finished){
                    [imageView removeFromSuperview];
                }
            }];
        }
    }];
}

- (void)pan:(UIPanGestureRecognizer *)panRecognizer
{
    if (panRecognizer.state == UIGestureRecognizerStateBegan) {
        startPanPoint = [panRecognizer locationInView:mView];
    }
    else if (panRecognizer.state == UIGestureRecognizerStateEnded)  {
        CGPoint stopLocation = [panRecognizer locationInView:mView];
        int dx = stopLocation.x - startPanPoint.x;
        int dy = stopLocation.y - startPanPoint.y;
        int distance = sqrt(dx*dx + dy*dy );
        NSString *direction;
        int degree = 0;
        float tan = MIN(abs(dx), abs(dy)) * 1.0 / MAX(abs(dx), abs(dy));
        if ( tan < 0.26) {      //正切值小于20度，正向
            if (abs(dx) > abs(dy)) {        //x方向
                if (dx > 0) {       //右
                    direction = @"右";
                    CGAffineTransform translateFrom  =CGAffineTransformTranslate(CGAffineTransformIdentity, 7, 0.0);
                    CGAffineTransform translateTo =CGAffineTransformTranslate(CGAffineTransformIdentity,-7, 0.0);
                    [self addArrowAnimation: DirectionRight transformFrom:translateFrom to:translateTo];
                }else {     //左
                    direction = @"左";
                    CGAffineTransform translateFrom  =CGAffineTransformTranslate(CGAffineTransformIdentity, -7, 0.0);
                    CGAffineTransform translateTo =CGAffineTransformTranslate(CGAffineTransformIdentity,7, 0.0);
                    [self addArrowAnimation: DirectionLeft transformFrom:translateFrom to:translateTo];
                }
                degree = abs(dx) / (mView.frame.size.width / 8);
            }else{      //y方向
                if (dy > 0) {       //上
                    direction = @"下";
                    CGAffineTransform translateFrom  =CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, 7.0);
                    CGAffineTransform translateTo =CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, -7.0);
                    [self addArrowAnimation: DirectionDown transformFrom:translateFrom to:translateTo];
                }else{      //下
                    direction = @"上";
                    CGAffineTransform translateFrom  =CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, -7.0);
                    CGAffineTransform translateTo =CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, 7.0);
                    [self addArrowAnimation: DirectionUp transformFrom:translateFrom to:translateTo];
                }
                degree = abs(dy) / (mView.frame.size.height / 8);
            }
        }else{                       //斜向
            if (dx > 0) {       //右
                if (dy > 0) {       //右下
                    direction = @"右下";
                    CGAffineTransform translateFrom  =CGAffineTransformTranslate(CGAffineTransformIdentity, -7.0, -7.0);
                    CGAffineTransform translateTo =CGAffineTransformTranslate(CGAffineTransformIdentity, 7.0, 7.0);
                    [self addArrowAnimation: DirectionRightDown transformFrom:translateFrom to:translateTo];
                }else {     //右上
                    direction = @"右上";
                    CGAffineTransform translateFrom  =CGAffineTransformTranslate(CGAffineTransformIdentity, -7.0, 7.0);
                    CGAffineTransform translateTo =CGAffineTransformTranslate(CGAffineTransformIdentity, 7.0, -7.0);
                    [self addArrowAnimation: DirectionRightUp transformFrom:translateFrom to:translateTo];
                }
            }else {     //左
                if (dy > 0) {       //左下
                    direction = @"左下";
                    CGAffineTransform translateFrom  =CGAffineTransformTranslate(CGAffineTransformIdentity, 7.0, -7.0);
                    CGAffineTransform translateTo =CGAffineTransformTranslate(CGAffineTransformIdentity, -7.0, 7.0);
                    [self addArrowAnimation: DirectionLeftDown transformFrom:translateFrom to:translateTo];
                }else {     //左上
                    direction = @"左上";
                    CGAffineTransform translateFrom  =CGAffineTransformTranslate(CGAffineTransformIdentity, 7.0, 7.0);
                    CGAffineTransform translateTo =CGAffineTransformTranslate(CGAffineTransformIdentity, -7.0, -7.0);
                    [self addArrowAnimation: DirectionLeftUp transformFrom:translateFrom to:translateTo];
                }
            }
            degree = distance / (mView.frame.size.width / 5);
        }
    }
}


@end
