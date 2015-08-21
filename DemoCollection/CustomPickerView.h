//
//  CustomPickerView.h
//  DemoCollection
//
//  Created by trier on 21/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPickerView : UIActionSheet
@property (weak, nonatomic) IBOutlet UIView *mView;

- (id)initWithTitle:(NSString *)title delegate:(id)delegate;
- (void)showInView:(UIView *)view;

@end
