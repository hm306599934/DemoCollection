
//
//  HtmlLocalVC.m
//  DemoCollection
//
//  Created by Jimmy on 22/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HtmlLocalVC.h"

@interface HtmlLocalVC()

@property (weak, nonatomic) IBOutlet UIWebView *mWebView;


@end

@implementation HtmlLocalVC
@synthesize mWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: @"H5Control" ofType :@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithPath:bundlePath];
    
    
    NSString *file1 = [[ NSBundle mainBundle] pathForResource: @"jay1" ofType :@"jpg"];
    NSString *file2 = [[ NSBundle mainBundle] pathForResource: @"jay2" ofType :@"jpg"];
    NSString *file3 = [[ NSBundle mainBundle] pathForResource: @"jay3" ofType :@"jpg"];
    NSString *file4 = [[ NSBundle mainBundle] pathForResource: @"jay4" ofType :@"jpg"];
    
    NSString* path = [resourceBundle pathForResource:@"index" ofType:@"html"];
    
    NSString *urlString = [NSString stringWithFormat:@"%@?file=%@;%@;%@;%@;",path,file1,file2,file3,file4];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [mWebView loadRequest:request];
    mWebView.scrollView.bounces = NO;
}

@end
