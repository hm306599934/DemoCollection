//
//  SelectPictureVC.m
//  DemoCollection
//
//  Created by trier on 20/8/15.
//  Copyright (c) 2015 浙江大华. All rights reserved.
//

#import "SelectPictureVC.h"
#import "UIView+Helper.h"
#import "CustomPickerView.h"

@interface SelectPictureVC ()

@end

@implementation SelectPictureVC

@synthesize mImageHead;

- (void)viewDidLoad {
    [super viewDidLoad];
    [mImageHead addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectPicture)]];
    [mImageHead addRadius:self.view.frame.size.width / 3/ 2];
}

- (void)viewWillLayoutSubviews{
    [super viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) selectPicture {
    CustomPickerView *pickerView = [[CustomPickerView alloc] initWithTitle:@"da" delegate:self];
    [pickerView showInView:self.view];
}

@end
