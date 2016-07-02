
//
//  DrawVC.m
//  DemoCollection
//
//  Created by Jimmy on 17/6/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "DrawVC.h"
#import "ProcessCircleView.h"

@interface DrawVC ()

@property (weak, nonatomic) IBOutlet ProcessCircleView *circleView;


@end

@implementation DrawVC

@synthesize circleView;

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
}

- (IBAction)chaneSlider:(UISlider *)sender {
    circleView.percent = sender.value;
}

@end
