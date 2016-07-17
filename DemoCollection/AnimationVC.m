//
//  AnimationVC.m
//  DemoCollection
//
//  Created by Jimmy on 18/8/15.
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
    data = [[NSArray alloc] initWithObjects:@"平移", @"旋转", @"变大", @"淡入", @"淡出", @"动态按钮", @"Core Animation",nil];
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
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationMove];
        [animationView show];
    }else if ([title isEqualToString:@"旋转"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationRotate];
        [animationView show];
    }else if ([title isEqualToString:@"变大"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationBigger];
        [animationView show];
    }else if ([title isEqualToString:@"淡入"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationFadeIn];
        [animationView show];
    }else if ([title isEqualToString:@"淡出"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationFadeOut];
        [animationView show];
    }else if ([title isEqualToString:@"动态按钮"]) {
        [self performSegueWithIdentifier:@"AnimationButton" sender:nil];
    }
}

@end
