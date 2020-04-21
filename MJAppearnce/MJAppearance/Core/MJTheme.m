//
//  MJTheme.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJTheme.h"
#import "MJAppearanceColorTable.h"

NSString * const MJThemeIdentifierNormal = @"NORMAL";
NSString * const MJThemeIdentifierDark = @"DARK";

NSString * const MJThemeIdentifierNormalSuffix = @"";
NSString * const MJThemeIdentifierDarkPicSuffix = @"_dark";

@interface MJTheme()
@end

@implementation MJTheme

+ (instancetype)sharedInstance {
    static MJTheme *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

- (instancetype)init {
    if(self = [super init]){
        self.currentThemeIdentifier = MJThemeIdentifierNormal;
        self.currentThemePicSuffix = MJThemeIdentifierNormalSuffix;
    }
    return self;
}

- (BOOL)darkMode {
    if ([self.currentThemeIdentifier isEqualToString:MJThemeIdentifierDark]) {
        return YES;
    }else{
        return NO;;
    }
}

- (BOOL)switchToNormal {
    self.currentThemeIdentifier = MJThemeIdentifierNormal;
    self.currentThemePicSuffix = MJThemeIdentifierNormalSuffix;
    [[NSNotificationCenter defaultCenter] postNotificationName:KAppThemeChangeNotifcation object:MJThemeIdentifierNormal];
    return YES;
}

- (BOOL)switchToDark {
    self.currentThemeIdentifier = MJThemeIdentifierDark;
    self.currentThemePicSuffix = MJThemeIdentifierDarkPicSuffix;
    [[NSNotificationCenter defaultCenter] postNotificationName:KAppThemeChangeNotifcation object:MJThemeIdentifierDark];
    return YES;
}

@end
