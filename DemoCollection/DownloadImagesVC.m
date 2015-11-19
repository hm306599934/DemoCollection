//
//  DownloadImagesVC
//  DemoCollection
//
//  Created by Jimmy on 12/11/2015.
//  Copyright © 2015 Jimmy. All rights reserved.
//

#import "DownloadImagesVC.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking/UIImageView+AFNetworking.h"

@implementation DownloadImagesVC
{
    NSArray *urlArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *ImageUrlFilePath = [[NSBundle mainBundle] pathForResource:@"ImageUrl" ofType:@"plist"];
    urlArray = [[NSArray alloc] initWithContentsOfFile:ImageUrlFilePath];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [urlArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"Cell";
    DownloadImagesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if ( cell == nil ) {
        cell = [[DownloadImagesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *urlString = urlArray[indexPath.row];
    cell.mLabel.text = urlString;
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:url
                                                  cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                              timeoutInterval:60];
    
    [cell.mImageView setImageWithURLRequest:imageRequest
                     placeholderImage:[UIImage imageNamed:@"image_1"]
                              success:nil
                              failure:nil];
    return cell;
}


@end


@implementation DownloadImagesTableViewCell

@synthesize mLabel;
@synthesize mImageView;


@end