//
//  AnimationVC.m
//  DemoCollection
//
//  Created by trier on 18/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "AnimationVC.h"
#import "AnimationView.h"

@interface AnimationVC ()

@end

@implementation AnimationVC
{
    NSArray *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        data = [[NSArray alloc] initWithObjects:@"平移", nil];
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
    if ([title isEqualToString:@"平移"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame:CGRectMake(0, 0, 100, 120) in: self.view];
        [animationView show];
        
    }
}

@end
