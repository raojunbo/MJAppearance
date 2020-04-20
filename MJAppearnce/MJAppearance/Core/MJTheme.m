//
//  MJTheme.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJTheme.h"

@implementation MJTheme

+ (instancetype)sharedInstance {
    static MJTheme *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

- (BOOL)darkMode {
    if ([self.currentTheme.themeIdentifier isEqualToString:@"1"]) {
     return YES;
    }else{
        return NO;;
    }
}
- (BOOL)switchToLight {
    BOOL sucess = [self switchToTheme:@"0"];
    if (sucess) {
        [[NSNotificationCenter defaultCenter] postNotificationName:KAppThemeChangeNotifcation object:@"1"];
    }
    return sucess;
}

- (BOOL)switchToDark {
    BOOL sucess =  [self switchToTheme:@"1"];
    if(sucess){
        [[NSNotificationCenter defaultCenter] postNotificationName:KAppThemeChangeNotifcation object:@"0"];
    }
    return sucess;
}

- (BOOL)switchToTheme:(NSString *)toThemeIdenfier {
    if ([self.currentTheme.themeIdentifier isEqualToString:toThemeIdenfier]) {
        return NO;
    }else{
        if([toThemeIdenfier isEqualToString:@"0"]){
            self.currentTheme = [self lightThemData];
        }else if([toThemeIdenfier isEqualToString:@"1"]){
            self.currentTheme = [self darkThemData];
        }else{
            return NO;
        }
        return YES;
    }
}

- (MJThemeData *)currentTheme {
    if(!_currentTheme){
        _currentTheme = [self lightThemData];
    }
    return _currentTheme;;
}

- (MJThemeData *)lightThemData {
    //读取主题数据
    MJThemeData *themeData = [[MJThemeData alloc]init];
    themeData.themeIdentifier = @"0";
    themeData.themePicPrefix = @"";
    themeData.Mojiblue = @"#4294EA";
    themeData.page = @"#EEF1F4";
    themeData.white = @"#FFFFFF";
    themeData.black01 = @"#212223";
    themeData.black02 = @"#666666";
    themeData.black03 = @"#999999";
    
    return themeData;
}

- (MJThemeData *)darkThemData {
    //读取主题数据
    MJThemeData *themeData = [[MJThemeData alloc]init];
    themeData.themeIdentifier = @"1";
    themeData.themePicPrefix = @"_dark";
    themeData.Mojiblue = @"#0576E6";
    themeData.page = @"#1A1A1A";
    themeData.white = @"#2B2B2D";
    themeData.black01 = @"#DDDDDF";
    themeData.black02 = @"#8E8E92";
    themeData.black03 = @"#616161";
    return themeData;
}



@end
