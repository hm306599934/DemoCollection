//
//  KeyAndValueVC.m
//  DemoCollection
//
//  Created by Jimmy on 11/6/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "KeyAndValueVC.h"
#import "Person.h"

static void *child1Context = &child1Context;
static void *child2Context = &child2Context;

@interface KeyAndValueVC()


@end


@implementation KeyAndValueVC
{
    Person *person1;
    Person *person2;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    person1 = [Person new];
    person1.name = @"lala";
    person2 = [Person new];
    person2.name = @"lalala";
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context == child1Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"aaaaaaaaaaaaaaaaa");
        }
    } else if (context == child2Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"bbbbbbbbbbbbbbbbb");
        }
    }
}

-(void)viewWillAppear:(BOOL)animated {
    //KVO
    [person1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    
    [person2 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child2Context];
    

    //KVC
    //[self setValue:person2 forKey:@"person1"];
    [self setValue:@"dasds" forKeyPath:@"person1.name"];
    [person1 setValue:@"1111" forKey:@"name"];
    [person2 setValue:@"2222" forKey:@"name"];
    NSLog(person1.name);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    else{
        return [super automaticallyNotifiesObserversForKey:key];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [person1 removeObserver:self forKeyPath:@"name"];
    [person2 removeObserver:self forKeyPath:@"name"];
}

@end
