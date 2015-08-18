//
//  SecondVC.h
//  DemoCollection
//
//  Created by trier on 13/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyDelegate <NSObject>
- (void)testDelegate;
@end


@interface DelegateVC : UIViewController
{
    id<MyDelegate> deleage;
}
@property(strong,nonatomic) id <MyDelegate> delegate;


- (IBAction)Submit:(UIButton *)sender;

@end
