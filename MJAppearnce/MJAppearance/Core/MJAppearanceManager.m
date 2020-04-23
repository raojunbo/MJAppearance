//
//  MJAppearanceManager.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAppearanceManager.h"

NSString * const MJAppearanceManagerColorLightKeySuffix = @"";
NSString * const MJAppearanceManagerColorDarkKeyPicSuffix = @"_dark";
NSString * const MJAppearanceManagerModeKey = @"MJAppearanceManagerModeKey";
@interface MJAppearanceManager()
@end

@implementation MJAppearanceManager

+ (instancetype)sharedInstance {
    static MJAppearanceManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

- (instancetype)init {
    if (self  = [super init]) {
        _currentMode = [self localMode];
    }
    return self;
}

- (MJAppearanceMode)localMode {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [[userDefaults valueForKey:MJAppearanceManagerModeKey] intValue];;
}

- (void)saveMode:(MJAppearanceMode)mode {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@(mode) forKey:MJAppearanceManagerModeKey];
}

- (void)setCurrentMode:(MJAppearanceMode)currentMode {
    if (_currentMode == currentMode) {
        return;
    }
    _currentMode = currentMode;
    [self saveMode:currentMode];
    switch (currentMode) {
        case MJAppearanceModeLight:{
            [[NSNotificationCenter defaultCenter] postNotificationName:KAppMJAppearanceChangeNotifcation object:MJAppearanceManagerColorLightKey];
        }
            
            break;
        case MJAppearanceModeDark:{
            [[NSNotificationCenter defaultCenter] postNotificationName:KAppMJAppearanceChangeNotifcation object:MJAppearanceManagerColorDarkKey];
        }
            
            break;
        default:
            break;
    }
    
}

- (NSString *)currentAppearanceColorKey {
    if(self.currentMode == MJAppearanceModeDark){
        return MJAppearanceManagerColorDarkKey;
    }else{
        return MJAppearanceManagerColorLightKey;
    }
}

- (NSString *)currentThemePicSuffix {
    if(self.currentMode == MJAppearanceModeDark){
        return MJAppearanceManagerColorDarkKeyPicSuffix;
    }else{
        return MJAppearanceManagerColorLightKeySuffix;
    }
}

@end
