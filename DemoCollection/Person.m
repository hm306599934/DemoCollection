//
//  Persoon.m
//  DemoCollection
//
//  Created by Jimmy on 11/6/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "Person.h"

@interface Person()

@property (nonatomic, strong) NSString *address;

@end

@implementation Person

@synthesize name, friends;

- (instancetype)init {
    self = [super init];
    if (self) {
        name = @"";
        _address = @"saddada";
        friends = [NSMutableArray new];
    }
    return self;
}

@end
