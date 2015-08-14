//
//  a.m
//  DemoCollection
//
//  Created by trier on 13/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import "UITableView+Helper.h"

@implementation UITableView(Helper)

- (void)hideExtreCell {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

@end
