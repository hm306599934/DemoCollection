//
//  PageScrollView.m
//  DemoCollection
//
//  Created by trier on 18/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import "PageScrollView.h"

@implementation PageScrollView
{
    UIScrollView *mScrollView;
}

- (id)initWithFrame:(CGRect)frame images:(NSArray*)images {
    self = [super initWithFrame: frame];
    if (self){
        mScrollView = [[UIScrollView alloc] initWithFrame:frame];
        mScrollView.pagingEnabled = YES;
        mScrollView.userInteractionEnabled = YES;
        mScrollView.scrollEnabled = YES;
        mScrollView.directionalLockEnabled = YES;
        mScrollView.showsHorizontalScrollIndicator = NO;
        mScrollView.showsVerticalScrollIndicator = NO;
        mScrollView.delegate = self; 
        mScrollView.contentSize = CGSizeMake(1000, self.frame.size.height);
        for (int i = 0; i < [images count]; i++) {
            UIImage* image = [UIImage imageNamed: [images objectAtIndex:i]];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * mScrollView.frame.size.width / 2, 0, mScrollView.frame.size.width, mScrollView.frame.size.height)];
            imageView.image = image;
            [mScrollView addSubview:imageView];
        }
        [self addSubview:mScrollView];
    }
    return self;
}

@end
