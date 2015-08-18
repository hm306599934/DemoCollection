//
//  ScrollViewVC.m
//  DemoCollection
//
//  Created by trier on 18/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
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
    data = [[NSArray alloc] initWithObjects:@"image_1", @"image_1", @"image_1", @"image_1",nil];
    PageScrollView *pageScrollVIew = [[PageScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 120) images:data];
    pageScrollVIew.backgroundColor = [UIColor redColor];
    [self.view addSubview:pageScrollVIew];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
