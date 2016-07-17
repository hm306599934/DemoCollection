//
//  BlockVC.m
//  DemoCollection
//
//  Created by Jimmy on 13/8/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

#import "BlockVC.h"

@interface BlockVC ()

@end

@implementation BlockVC
@synthesize myBlock;
          
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if (myBlock != nil) {
        myBlock();
    }
}

- (void)initBlock:(MyBlock)block {
    myBlock = block;
}

@end
