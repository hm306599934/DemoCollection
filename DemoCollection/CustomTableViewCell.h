//
//  CustomTableViewCell.h
//  DemoCollection
//
//  Created by Jimmy on 14/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *mLabelTitle;
@property (weak, nonatomic) IBOutlet UILabel *mLabelContent;

@end
