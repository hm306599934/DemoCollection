//
//  AttackHandler.m
//  DemoCollection
//
//  Created by Jimmy on 16/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "AttackHandler.h"

@implementation AttackHandler
@synthesize nextAttactHandler;

- (void)handleAttack:(Attack *)attack {
    [nextAttactHandler handleAttack:attack];
}




@end
