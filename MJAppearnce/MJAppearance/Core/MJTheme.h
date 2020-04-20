//
//  MJTheme.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJThemeData.h"
NS_ASSUME_NONNULL_BEGIN


@interface MJTheme : NSObject

@property (nonatomic,strong) MJThemeData *currentTheme;

+ (instancetype)sharedInstance;

- (BOOL)switchToTheme:(NSString *)toThemeIdenfier;

@end

NS_ASSUME_NONNULL_END
