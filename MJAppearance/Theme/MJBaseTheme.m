//
//  MJBaseTheme.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/27.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJBaseTheme.h"

@implementation MJBaseTheme

- (instancetype)init {
    if(self = [super init]){
    }
    return self;
}

- (void)loadColorConfigures {
    //子类去实现
}

- (void)loadDefaultColors {
    //子类去实现
}

@end
