//
//  TempInputView.m
//  DemoCollection
//
//  Created by Jimmy on 23/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "TempInputView.h"
#import "UIView+HMDefine.h"
#import "View+MASAdditions.h"
#import "NSString+HMDefine.h"

@interface TempInputView()<UITextFieldDelegate>

@property(nonatomic, strong) UIButton *mRightButton;
@property(nonatomic, strong) UITextField *mTextField;
@property(nonatomic, strong) NSMutableString *mContentString;
@property(nonatomic, strong) NSMutableString *mPasswordString;

@end

@implementation TempInputView

#pragma mark - 初始化

- (instancetype)init {
    if (self = [super init]) {
        [self initial];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initial];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initial];
    }
    return self;
}

- (void)initial {
    [self setBorderWidth:1 color:[UIColor lightGrayColor]];
    [self addSubview:self.mTextField];
    [self addSubview:self.mRightButton];
    [self initPassswordVisibleMode];
    
    
    NSAttributedString *yourString = [[NSAttributedString alloc] initWithString:@"Your text" attributes:@{
                                                                                                          NSStrokeColorAttributeName:[UIColor redColor],
                                                                                                          NSStrokeWidthAttributeName:[NSNumber numberWithFloat:-1.0],
                                                                                                          NSFontAttributeName:[UIFont systemFontOfSize:24.0f],
                                                                                                          NSForegroundColorAttributeName:[UIColor greenColor]
                                                                                                          }];
    self.mTextField.attributedText = yourString;
}

- (UITextField *)mTextField {
    if (_mTextField == nil) {
        _mTextField = [UITextField new];
        _mTextField.delegate = self;
    }
    return _mTextField;
}

- (NSMutableString *)mContentString {
    if (_mContentString == nil) {
        _mContentString = NSMutableString.new;
    }
    return _mContentString;
}

- (NSMutableString *)mPasswordString {
    if (_mPasswordString == nil) {
        _mPasswordString = NSMutableString.new;
    }
    return _mPasswordString;
}

- (UIButton *)mRightButton {
    if (_mRightButton == nil) {
        _mRightButton = [UIButton new];
        [_mRightButton addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mRightButton;
}

- (void)initPassswordVisibleMode {
    [self.mRightButton setImage:[UIImage imageNamed:@"icon_eye_close"] forState:UIControlStateNormal];
    [self.mRightButton setImage:[UIImage imageNamed:@"icon_eye_open"] forState:UIControlStateSelected];
    
    [self.mRightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.width.mas_equalTo(40);
    }];
    
    [self.mTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self.mRightButton.mas_left).mas_offset(10);
        make.left.mas_equalTo(self);
    }];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    [self.mPasswordString appendString:string];
    self.mTextField.text = self.mPasswordString;
    return NO;
}

- (void)clickRightButton:(UIButton*)sender {
    self.mRightButton.selected = !self.mRightButton.selected;
    
    if (self.mRightButton.selected) {
        //显示秘钥
        self.mTextField.text = self.mContentString;
    } else {
        //不显示秘钥
        self.mTextField.text = self.mPasswordString;
    }
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
//    if (self.mRightButton.selected) {
//        for (int i = 0; i < self.mPasswordString.length; i++) {
//            CGFloat x = 10 * (i + 1);
//            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, 10, 10, 10)];
//            [[UIColor redColor] setFill];
//            [path fill];
//        }
//    }else {
//        self.mTextField.text = self.mContentString;
//    }
}

- (void)drawTextInRect:(CGRect)rect {
    //[super drawTextInRect:rect];
    
    for (int i = 0; i < self.mPasswordString.length; i++) {
        CGFloat x = 10 * (i + 1);
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, 10, 10, 10)];
        [[UIColor redColor] setFill];
        [path fill];
    }
}

@end