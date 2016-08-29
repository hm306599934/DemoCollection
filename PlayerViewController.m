//
//  PlayerViewController.m
//  DemoCollection
//
//  Created by Jimmy on 25/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "PlayerViewController.h"

@implementation PlayerViewController

- (IBAction)playVideo:(UIButton *)sender {
    [self performSegueWithIdentifier:@"Play" sender:nil];
}

@end
