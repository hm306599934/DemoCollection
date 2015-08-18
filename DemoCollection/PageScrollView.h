//
//  PageScrollView.h
//  DemoCollection
//
//  Created by trier on 18/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageScrollView : UIView<UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame images:(NSArray*)images;

@end