//
//  EnumeratorVC.m
//  DemoCollection
//
//  Created by Jimmy on 29/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "EnumeratorVC.h"

@implementation EnumeratorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"a", @"b", @"c", @"d"];
    NSEnumerator *enumerator = [array objectEnumerator];
    
    NSString *item;
    while (item = [enumerator nextObject]) {
        NSLog(item);
    }
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *enumerator = (NSString *)obj;
        NSLog([NSString stringWithFormat:@"...%@...%d", enumerator, idx]);
        if ([enumerator isEqualToString:@"c"]) {
            *stop = YES;
        }
    }];
}

@end
