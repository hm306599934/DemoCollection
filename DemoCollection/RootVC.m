//
//  RootVC.m
//  DemoCollection
//
//  Created by Jimmy on 13/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "RootVC.h"
#import "UITableView+Helper.h"

@interface RootVC ()

@end

@implementation RootVC
{
    NSArray *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    data = [[NSArray alloc] initWithObjects:@"System", @"设计模式", @"Core Graphic", @"AVFoundation", @"动画效果", @"KVO", @"回调", @"UITableView", @"UICollectionView", @"UIScrollView", @"GCD", @"上拉下拉", @"网络", @"选取图片", @"侧边栏",  @"手势",  @"其他", nil];
    [self.tableView hideExtreCell];
    
    //滑动时隐藏导航栏
    //self.navigationController.hidesBarsOnSwipe = YES;
    
    //消除导航条返回键带的title
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated: YES];
    NSString *title = [data objectAtIndex:indexPath.row];
    
    if ([title isEqualToString:@"回调"])
    {
        [self performSegueWithIdentifier:@"CallBack" sender:nil];
    }
    else if ([title isEqualToString:@"UITableView"])
    {
        [self performSegueWithIdentifier:@"TableView" sender:nil];
    }
    else if ([title isEqualToString:@"GCD"])
    {
        [self performSegueWithIdentifier:@"GCD" sender:nil];
    }
    else if ([title isEqualToString:@"动画效果"])
    {
        [self performSegueWithIdentifier:@"Animation" sender:nil];
    }
    else if ([title isEqualToString:@"UIScrollView"])
    {
        [self performSegueWithIdentifier:@"ScrollView" sender:nil];
    }
    else if ([title isEqualToString:@"选取图片"])
    {
        [self performSegueWithIdentifier:@"SelectPicture" sender:nil];
    }
    else if ([title isEqualToString:@"手势"])
    {
        [self performSegueWithIdentifier:@"Gesture" sender:nil];
    }
    else if ([title isEqualToString:@"上拉下拉"])
    {
        [self performSegueWithIdentifier:@"LoadMore" sender:nil];
    }
    else if ([title isEqualToString:@"网络"])
    {
        [self performSegueWithIdentifier:@"DownloadImage" sender:nil];
    }
    else if ([title isEqualToString:@"KVO"])
    {
        [self performSegueWithIdentifier:@"KVO" sender:nil];
    }
    else if ([title isEqualToString:@"设计模式"])
    {
        [self performSegueWithIdentifier:@"DesignPattern" sender:nil];
    }
    else if ([title isEqualToString:@"画图"])
    {
        [self performSegueWithIdentifier:@"Draw" sender:nil];
    }
    else if ([title isEqualToString:@"其他"])
    {
        [self performSegueWithIdentifier:@"Other" sender:nil];
    }
    else if ([title isEqualToString:@"Core Graphic"])
    {
        [self performSegueWithIdentifier:@"CoreGraphic" sender:nil];
    }
    else if ([title isEqualToString:@"System"])
    {
        [self performSegueWithIdentifier:@"System" sender:nil];
    }
    else if ([title isEqualToString:@"AVFoundation"])
    {
        [self performSegueWithIdentifier:@"AVFoundation" sender:nil];
    }
    
}

@end
