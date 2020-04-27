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

NSString * const MJAppearanceManagerUserInterfaceStyleKey = @"MJAppearanceManagerUserInterfaceStyleKey";
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
        _currentInterfaceStyle = [self localUserInterfaceStyle];
        //通知目的：iOS13及iOS13以下的图片的更新在进入前台时，都需要根据当前样式更新图片。
         if (@available(iOS 13.0, *)) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(systemInterfaceStyleChange) name:UIApplicationDidBecomeActiveNotification object:nil];
         }
     
    }
    return self;
}

- (void)systemInterfaceStyleChange {
    if (@available(iOS 13.0, *)) {
        if( [UITraitCollection currentTraitCollection].userInterfaceStyle == UIUserInterfaceStyleLight) {
            [MJAppearanceManager sharedInstance].currentInterfaceStyle = MJUserInterfaceStyleLight;
        }else{
            [MJAppearanceManager sharedInstance].currentInterfaceStyle = MJUserInterfaceStyleDark;
        }
    } else {
        //nothing to do
    }
}

- (MJUserInterfaceStyle)localUserInterfaceStyle {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *interfaceStyle =  [userDefaults valueForKey:MJAppearanceManagerUserInterfaceStyleKey];
    if(interfaceStyle == nil){
        interfaceStyle = @0;
    }
    return (MJUserInterfaceStyle)[interfaceStyle intValue];
}

- (void)saveUserInterfaceStyle:(MJUserInterfaceStyle)mode {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@(mode) forKey:MJAppearanceManagerUserInterfaceStyleKey];
}

- (void)setCurrentInterfaceStyle:(MJUserInterfaceStyle)currentInterfaceStyle {
    if (_currentInterfaceStyle == currentInterfaceStyle) {
        return;
    }
    _currentInterfaceStyle = currentInterfaceStyle;
    [self saveUserInterfaceStyle:currentInterfaceStyle];
    switch (currentInterfaceStyle) {
        case MJUserInterfaceStyleLight:{
            [[NSNotificationCenter defaultCenter] postNotificationName:KAppMJAppearanceChangeNotifcation object:nil];
        }
            break;
        case MJUserInterfaceStyleDark:{
            [[NSNotificationCenter defaultCenter] postNotificationName:KAppMJAppearanceChangeNotifcation object:nil];
        }
            
            break;
        default:
            break;
    }
}

- (NSString *)darkInterfaceStylePicSuffix {
    if(self.currentInterfaceStyle == MJUserInterfaceStyleDark){
        return MJAppearanceManagerColorDarkKeyPicSuffix;
    }else{
        return MJAppearanceManagerColorLightKeySuffix;
    }
}

@end
