//
//  ScrollViewVC.m
//  DemoCollection
//
//  Created by trier on 18/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "ScrollViewVC.h"
#import "PageScrollView.h"

@interface ScrollViewVC ()

@end

@implementation ScrollViewVC
{
    NSArray *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    data = [[NSArray alloc] initWithObjects:@"image_1", @"image_2", @"image_3", @"image_4",nil];
    PageScrollView *pageScrollVIew = [[PageScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 120) images:data];
    [self.view addSubview:pageScrollVIew];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
