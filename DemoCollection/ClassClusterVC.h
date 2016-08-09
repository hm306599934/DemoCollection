//
//  ClassClusterVC.h
//  DemoCollection
//
//  Created by Jimmy on 30/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>\

typedef enum {
    EmplyeeTypeEngineer,
    EmplyeeTypeDoctor,
}EmplyeeType;

@interface ClassClusterVC : UIViewController

@end

@interface HMEmployee : NSObject

- (instancetype)initEmployeeWithType:(EmplyeeType)type;

- (void)work;

- (void)rest;

@end

@interface HMEmployeeEngineer : HMEmployee

@end


@interface HMEmployeeDoctor : HMEmployee

@end
