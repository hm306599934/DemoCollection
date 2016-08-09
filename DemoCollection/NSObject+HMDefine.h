//
//  NSObject+HMDefine.h
//  DemoCollection
//
//  Created by Jimmy on 3/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(RunTime)

- (Class)getClass;

- (NSString *)getClassName;

- (NSArray *)getPropertyName;

@end
