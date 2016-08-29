//
//  NSString+HMDefine.m
//  DemoCollection
//
//  Created by Jimmy on 15/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "NSString+HMDefine.h"

@implementation NSString(HMDefine)

- (CGFloat)widthWithFont:(UIFont *)font {
    return [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font} context:nil].size.width;
}

@end
