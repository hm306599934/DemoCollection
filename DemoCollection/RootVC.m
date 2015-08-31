//
//  RootVC.m
//  DemoCollection
//
//  Created by trier on 13/8/15.
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
    data = [[NSArray alloc] initWithObjects:@"回调", @"UITableView", @"UICollectionView", @"UIScrollView", @"GCD", @"上拉下拉", @"网络", @"选取图片", @"扫描二维码", @"侧边栏", @"动画效果", @"手势", @"其他", nil];
    [self.tableView hideExtreCell];
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
    if ([title isEqualToString:@"回调"]) {
        [self performSegueWithIdentifier:@"CallBack" sender:nil];
    }else if ([title isEqualToString:@"UITableView"]) {
        [self performSegueWithIdentifier:@"TableView" sender:nil];
    }else if ([title isEqualToString:@"GCD"]) {
        [self performSegueWithIdentifier:@"GCD" sender:nil];
    }else if ([title isEqualToString:@"动画效果"]) {
        [self performSegueWithIdentifier:@"Animation" sender:nil];
    }else if ([title isEqualToString:@"UIScrollView"]) {
        [self performSegueWithIdentifier:@"ScrollView" sender:nil];
    }else if ([title isEqualToString:@"选取图片"]) {
        [self performSegueWithIdentifier:@"SelectPicture" sender:nil];
    }else if ([title isEqualToString:@"手势"]) {
        [self performSegueWithIdentifier:@"Gesture" sender:nil];
    }else if ([title isEqualToString:@"上拉下拉"]) {
        [self performSegueWithIdentifier:@"LoadMore" sender:nil];
    }else if ([title isEqualToString:@"其他"]) {
        [self performSegueWithIdentifier:@"Other" sender:nil];
    }
}

@end
