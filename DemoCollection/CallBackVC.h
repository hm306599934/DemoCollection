//
//  FirstVC.h
//  DemoCollection
//
//  Created by trier on 13/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateVC.h"

@interface CallBackVC : UIViewController<MyDelegate>

- (IBAction)doDelegate:(UIButton *)sender;
- (IBAction)doBlock:(UIButton *)sender;

@end
