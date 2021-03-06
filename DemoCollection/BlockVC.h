//
//  BlockVC.h
//  DemoCollection
//
//  Created by Jimmy on 13/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MyBlock)(void);

@interface BlockVC : UIViewController
@property(strong,nonatomic) MyBlock myBlock;

- (IBAction)submit:(UIButton *)sender;
- (void)initBlock:(MyBlock)block;
@end
