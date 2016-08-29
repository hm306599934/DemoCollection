//
//  HMTextInputView.m
//  DemoCollection
//
//  Created by Jimmy on 9/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HMTextInputView.h"
#import "UIView+HMDefine.h"
#import "View+MASAdditions.h"
#import "NSString+HMDefine.h"

@interface HMTextInputView()<UITextFieldDelegate>

@property(nonatomic, strong) UIButton *mRightButton;
@property(nonatomic, strong) UILabel *mTitleLabel;
@property(nonatomic, strong) NSMutableString *mContentString;
@property(nonatomic, strong) NSMutableString *mPasswordString;

@end

@implementation HMTextInputView
{
    TextInputViewMode mMode;
}

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
    [self addSubview:self.mTitleLabel];
    [self addSubview:self.mTextField];
    [self addSubview:self.mRightButton];
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

- (UILabel *)mTitleLabel {
    if (_mTitleLabel == nil) {
        _mTitleLabel = UILabel.new;
    }
    return _mTitleLabel;
}


-(void)setTitle:(NSString *)title {
    self.mTitleLabel.text = title;
    CGFloat textWidth = [title widthWithFont:self.mTitleLabel.font] + 4;
    [self.mTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.width.mas_equalTo(textWidth);
        make.left.mas_equalTo(self);
    }];
    
    [self.mTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self.mRightButton.mas_left).mas_offset(10);
        make.left.mas_equalTo(self.mTitleLabel.mas_right);
    }];
}

-(void)setFont:(UIFont *)font {
    self.mTitleLabel.font = font;
    self.mTextField.font = font;
}

- (void)setMode:(TextInputViewMode)mode {
    mMode = mode;
    if (mode == TextInputViewModeDefault) {
        [self initDefailtMode];
    }else if (mode == TextInputViewModePassswordVisible) {
        [self initPassswordVisibleMode];
    }
}

- (UIButton *)mRightButton {
    if (_mRightButton == nil) {
        _mRightButton = [UIButton new];
        [_mRightButton addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mRightButton;
}

- (void)initDefailtMode {
    [self.mTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
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
    if ([string isEqualToString:@""]) {
        [self.mContentString deleteCharactersInRange:NSMakeRange(self.mContentString.length - 1, 1)];
        [self.mPasswordString deleteCharactersInRange:NSMakeRange(self.mPasswordString.length - 1, 1)];
        return YES;
    }
    
    if (mMode == TextInputViewModePassswordVisible) {
        [self.mContentString appendString:string];
        [self.mPasswordString appendString:@"●"];
       
        if (self.mRightButton.selected) {
            textField.text = self.mContentString;
        }else {
            textField.text = self.mPasswordString;
        }
        
        return NO;
    }
    
    [self setNeedsDisplay];
    return YES;
}

- (void)clickRightButton:(UIButton*)sender {
    self.mRightButton.selected = !self.mRightButton.selected;
    
    if (self.mRightButton.selected) {
        //显示秘钥
        [self setMode:TextInputViewModePassswordVisible];
        self.mTextField.text = self.mContentString;
    } else {
        //不显示秘钥
        [self setMode:TextInputViewModePassswordVisible];
        self.mTextField.text = self.mPasswordString;
    }
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (mMode == TextInputViewModePassswordVisible) {
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 10, 10, 10)];
        [[UIColor redColor] setFill];
        [path fill];
        
    }else {
        self.mTextField.text = self.mContentString;
    }
}

@end
