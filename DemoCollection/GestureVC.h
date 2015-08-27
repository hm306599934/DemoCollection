//
//  GestureVC.h
//  DemoCollection
//
//  Created by Tony on 8/23/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DirectionUp = 0,
    DirectionDown = 1,
    DirectionLeft = 2,
    DirectionRight = 3,
    DirectionLeftUp= 4,
    DirectionLeftDown = 5,
    DirectionRightUp = 6,
    DirectionRightDown = 7
} Direction;  //云台方向


@interface GestureVC : UIViewController
@property (strong, nonatomic) IBOutlet UIView *mView;

@end
