//
//  RuntimeVC.h
//  DemoCollection
//
//  Created by Jimmy on 28/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RuntimeVC : UIViewController

@end

@interface Jimmy : NSObject<NSCoding, NSCopying>

@property(nonatomic, strong) NSString *mName;

@property(nonatomic, assign) int mAge;

- (void)sayHello;

@end

@interface BoyFriend : NSObject

@property(nonatomic, strong) NSString *mName;

@property(nonatomic, strong) Jimmy *mFriend;

@end
