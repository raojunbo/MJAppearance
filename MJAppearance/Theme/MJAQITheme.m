//
//  MJAQITheme.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/27.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAQITheme.h"
#import "MJAppearanceColor.h"

@interface MJAQITheme()

@end

@implementation MJAQITheme

- (instancetype)init {
    if(self = [super init]){
        self.themeName = @"AQI";
        [self loadColorConfigures];
        [self loadDefaultColors];
    }
    return self;
}

- (void)loadThemesColors {
    [self loadColorConfigures];
    [self loadDefaultColors];
}

- (void)loadColorConfigures {
    self.colorsTableConfigure =  @{
        @"aqiGreen01":@{MJColorLightKey:@(0x4294EA),@"DARK":@(0x0576E6)},
        @"aqiYellow01":@{MJColorLightKey:@(0xEEF1F4),@"DARK":@(0x1A1A1A)},
        @"aqiOrange01":@{MJColorLightKey:@(0xFFFFFF),@"DARK":@(0x2B2B2D)},
        @"aqiRed01":@{MJColorLightKey:@(0x212223),@"DARK":@(0xDDDDDF)},
        @"aqiPurple01":@{MJColorLightKey:@(0x666666),@"DARK":@(0x8E8E92)},
        @"aqiDeepred01":@{MJColorLightKey:@(0x999999),@"DARK":@(0x616161)}
    };
}

- (void)loadDefaultColors {
    self.aqiGreen01 = [self mj_appearanceColorWithName:@"aqiGreen01"];
    self.aqiYellow01 = [self mj_appearanceColorWithName:@"aqiYellow01"];
    self.aqiOrange01 = [self mj_appearanceColorWithName:@"aqiOrange01"];
    self.aqiRed01 = [self mj_appearanceColorWithName:@"aqiRed01"];
    self.aqiPurple01 = [self mj_appearanceColorWithName:@"aqiPurple01"];
    self.aqiDeepred01 = [self mj_appearanceColorWithName:@"aqiDeepred01"];
}

- (UIColor *)mj_appearanceColorWithName:(NSString *)colorName {
    return  [MJAppearanceColor mj_appearanceColorWithThemeName:self.themeName colorName:colorName];
}
@end
