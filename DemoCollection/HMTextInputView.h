//
//  HMTextInputView.h
//  DemoCollection
//
//  Created by Jimmy on 9/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TextInputViewModeDefault,
    TextInputViewModePassswordVisible,
}TextInputViewMode;

@interface HMTextInputView : UIView

//模式，需要优先设置
@property(nonatomic, assign) TextInputViewMode mode;
//标题，显示左边
@property(nonatomic, copy) NSString *title;
//字体
@property(nonatomic, weak) UIFont *font;
//输入框
@property(nonatomic, strong) UITextField *mTextField;


@end
