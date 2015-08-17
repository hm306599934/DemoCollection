//
//  CustomTableViewCell.m
//  DemoCollection
//
//  Created by trier on 14/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "UIView+Helper.h"

@implementation CustomTableViewCell
@synthesize mImageView;
@synthesize mLabelContent, mLabelTitle;

- (void)awakeFromNib {
    [mImageView addRadius:5];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end