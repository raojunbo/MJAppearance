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

static NSString *KAppThemeChangeNotifcation = @"KAppThemeChangeNotifcation";

@interface MJTheme : NSObject

@property (nonatomic,strong) MJThemeData *currentTheme;

+ (instancetype)sharedInstance;

- (BOOL)switchToLight;
- (BOOL)switchToDark;

@end

NS_ASSUME_NONNULL_END
