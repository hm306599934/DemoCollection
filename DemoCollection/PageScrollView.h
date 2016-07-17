//
//  PageScrollView.h
//  DemoCollection
//
//  Created by Jimmy on 18/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageScrollView : UIView<UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame images:(NSArray*)images;

@end
