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

extern NSString * const MJThemeIdentifierNormal;
extern NSString * const MJThemeIdentifierDark;

static NSString *KAppThemeChangeNotifcation = @"KAppThemeChangeNotifcation";

@interface MJTheme : NSObject

@property (nonatomic, strong) NSString *currentThemeIdentifier;//主题名称
@property (nonatomic, strong) NSString *currentThemePicSuffix;//主题图片后缀
@property (nonatomic,assign,readonly) BOOL darkMode;//是否是黑暗模式

+ (instancetype)sharedInstance;

- (BOOL)switchToNormal;
- (BOOL)switchToDark;

@end

NS_ASSUME_NONNULL_END
