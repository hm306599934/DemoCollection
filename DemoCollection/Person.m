//
//  Persoon.m
//  DemoCollection
//
//  Created by Jimmy on 11/6/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name, friends;

- (instancetype)init {
    self = [super init];
    if (self) {
        name = @"";
        friends = [NSMutableArray new];
    }
    return self;
}

@end
