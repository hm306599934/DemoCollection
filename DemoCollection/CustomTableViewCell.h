//
//  CustomTableViewCell.h
//  DemoCollection
//
//  Created by trier on 14/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *mLabelTitle;
@property (weak, nonatomic) IBOutlet UILabel *mLabelContent;

@end
