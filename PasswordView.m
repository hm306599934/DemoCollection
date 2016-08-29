//
//  PasswordView.m
//  DemoCollection
//
//  Created by Jimmy on 15/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "PasswordView.h"

@interface PasswordView()<UIKeyInput>
@property (assign, nonatomic) NSUInteger passWordNum;//密码的位数
@property (assign, nonatomic) CGFloat squareWidth;//正方形的大小
@property (assign, nonatomic) CGFloat pointRadius;//黑点的半径
@property (strong, nonatomic) UIColor *pointColor;//黑点的颜色
@property (strong, nonatomic) UIColor *rectColor;//边框的颜色
@property (strong, nonatomic) NSMutableString *textStore;
@end

@implementation PasswordView

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
    
    self.textStore = NSMutableString.new;
    self.squareWidth = 45;
    self.passWordNum = 6;
    self.pointRadius = 6;
    self.rectColor = [UIColor blackColor];
    self.pointColor = [UIColor blackColor];
    
}

#pragma mark - UIKeyInput Delegate

- (BOOL)hasText {
    
    return YES;
}

- (void)insertText:(NSString *)text {
    if (self.textStore.length < self.passWordNum) {
        //判断是否是数字
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefghijklmnopqrstuvwxyz"] invertedSet];
        NSString*filtered = [[text componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [text isEqualToString:filtered];
        if(basicTest) {
            [self.textStore appendString:text];
            
            if (self.textStore.length == self.passWordNum) {
                
            }
            [self setNeedsDisplay];
        }
    }
}

- (void)deleteBackward {
    if (self.textStore.length > 0) {
        [self.textStore deleteCharactersInRange:NSMakeRange(self.textStore.length - 1, 1)];
       
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGFloat height = rect.size.height;
    CGFloat width = rect.size.width;
    CGFloat x = 0.5;
    CGFloat y = 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画外框
    CGContextAddRect(context, CGRectMake( x, y, rect.size.width - 1, rect.size.height - 1));
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, self.rectColor.CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    //画竖条
    for (int i = 1; i <= self.passWordNum; i++) {
        CGContextMoveToPoint(context, x+i*self.squareWidth, y);
        CGContextAddLineToPoint(context, x+i*self.squareWidth, y+self.squareWidth);
        CGContextClosePath(context);
    }
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextSetFillColorWithColor(context, self.pointColor.CGColor);
    //画黑点
    for (int i = 1; i <= self.textStore.length; i++) {
        CGContextAddArc(context,  x+i*self.squareWidth - self.squareWidth/2.0, y+self.squareWidth/2, self.pointRadius, 0, M_PI*2, YES);
        CGContextDrawPath(context, kCGPathFill);
    }
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (![self isFirstResponder]) {
        [self becomeFirstResponder];
    }
}

- (BOOL)becomeFirstResponder {

    return [super becomeFirstResponder];
}

@end
