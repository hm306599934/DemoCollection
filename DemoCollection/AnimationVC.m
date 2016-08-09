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
    data = [[NSArray alloc] initWithObjects:@"平移", @"旋转", @"变大", @"淡入", @"淡出", @"frame", @"bounds", @"center", @"transform", @"alpha", @"backgroundColor", nil];
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
    }else if ([title isEqualToString:@"frame"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationFrame];
        [animationView show];
    }else if ([title isEqualToString:@"bounds"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationBounds];
        [animationView show];
    }else if ([title isEqualToString:@"center"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationCenter];
        [animationView show];
    }else if ([title isEqualToString:@"transform"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationTransform];
        [animationView show];
    }else if ([title isEqualToString:@"alpha"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationAlpha];
        [animationView show];
    }else if ([title isEqualToString:@"backgroundColor"]) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame: self.view.frame in: self.view type:AnimationBackgroundColor];
        [animationView show];
    }
}

@end
