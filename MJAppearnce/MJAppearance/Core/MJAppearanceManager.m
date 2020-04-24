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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(systemInterfaceStyleChange) name:UIApplicationDidBecomeActiveNotification object:nil];
        _currentInterfaceStyle = [self localMode];
    }
    return self;
}

- (void)systemInterfaceStyleChange {
    if (@available(iOS 13.0, *)) {
        UIWindow *window =  [UIApplication sharedApplication].keyWindow;
        if(window.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
            [MJAppearanceManager sharedInstance].currentInterfaceStyle = MJUserInterfaceStyleLight;
        }else{
            [MJAppearanceManager sharedInstance].currentInterfaceStyle = MJUserInterfaceStyleDark;
        }
    } else {
        //nothing to do
    }
}

- (MJUserInterfaceStyle)localMode {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *interfaceStyle =  [userDefaults valueForKey:MJAppearanceManagerUserInterfaceStyleKey];
    if(interfaceStyle == nil){
        interfaceStyle = @0;
    }
    return (MJUserInterfaceStyle)[interfaceStyle intValue];
}

- (void)saveMode:(MJUserInterfaceStyle)mode {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@(mode) forKey:MJAppearanceManagerUserInterfaceStyleKey];
}

- (void)setCurrentInterfaceStyle:(MJUserInterfaceStyle)currentInterfaceStyle {
    if (_currentInterfaceStyle == currentInterfaceStyle) {
        return;
    }
    _currentInterfaceStyle = currentInterfaceStyle;
    [self saveMode:currentInterfaceStyle];
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
