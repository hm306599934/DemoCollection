//
//  Persoon.h
//  DemoCollection
//
//  Created by Jimmy on 11/6/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, copy) NSString *name;

@property(nonatomic, strong) NSMutableArray *friends;

@end
