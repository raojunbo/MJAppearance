//
//  MJAppearanceManager.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN


static NSString * const MJAppearanceManagerColorLightKey = @"Light";
static NSString * const MJAppearanceManagerColorDarkKey = @"DARK";
static NSString * const KAppMJAppearanceChangeNotifcation = @"KAppMJAppearanceChangeNotifcation";

typedef NS_ENUM(NSInteger, MJAppearanceMode) {
    MJAppearanceModeLight,
    MJAppearanceModeDark
};

@interface MJAppearanceManager : NSObject

@property (nonatomic, strong,readonly) NSString *currentAppearanceColorKey;

@property (nonatomic, strong,readonly) NSString *currentThemePicSuffix;

@property (nonatomic, assign) MJAppearanceMode currentMode;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
