//
//  AttackHandler.h
//  DemoCollection
//
//  Created by Jimmy on 16/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attack.h"

@interface AttackHandler : NSObject

@property (nonatomic, retain) AttackHandler *nextAttactHandler;

- (void)handleAttack:(Attack*)attack;

@end
