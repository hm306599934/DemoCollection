//
//  OtherVC.m
//  DemoCollection
//
//  Created by Jimmy on 19/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "OtherVC.h"

@interface OtherVC ()

@end

@implementation OtherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *contentView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    contentView.backgroundColor = [UIColor clearColor];
    UILabel *contentLabel = UILabel.new;
    contentLabel.frame = CGRectMake(15, 0, contentView.frame.size.width - 30, contentView.frame.size.height);
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    contentLabel.text = @"dsadasddsad";
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentJustified;
    [contentView addSubview:contentLabel];
    
    
    //[self.tableView setTableHeaderView:contentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *contentView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    contentView.backgroundColor = [UIColor clearColor];
    UILabel *contentLabel = UILabel.new;
    contentLabel.frame = CGRectMake(15, 0, contentView.frame.size.width - 30, contentView.frame.size.height);
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    contentLabel.text = @"daa大大的";
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentJustified;
    [contentView addSubview:contentLabel];
    
    return contentView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
