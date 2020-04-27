//
//  MJMainTheme.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/27.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJMainTheme.h"
#import "MJAppearanceColor.h"

@interface MJMainTheme ()

@end
@implementation MJMainTheme

- (instancetype)init {
    if(self = [super init]){
        self.themeName = @"main";
        
    }
    return self;
}

- (void)loadThemesColors {
    [self loadColorConfigures];
    [self loadDefaultColors];
}

- (void)loadColorConfigures {
    self.colorsTableConfigure =  @{
        @"Mojiblue":@{MJColorLightKey:@(0x4294EA),@"DARK":@(0x0576E6)},
        @"page":@{MJColorLightKey:@(0xEEF1F4),@"DARK":@(0x1A1A1A)},
        @"white":@{MJColorLightKey:@(0xFFFFFF),@"DARK":@(0x2B2B2D)},
        @"black01":@{MJColorLightKey:@(0x212223),@"DARK":@(0xDDDDDF)},
        @"black02":@{MJColorLightKey:@(0x666666),@"DARK":@(0x8E8E92)},
        @"black03":@{MJColorLightKey:@(0x999999),@"DARK":@(0x616161)},
        @"lightgrey":@{MJColorLightKey:@(0xF9F9F9),@"DARK":@(0x353535)},
        @"black":@{MJColorLightKey:@(0x000000),@"DARK":@(0xDDDDDF)},
        @"black05":@{MJColorLightKey:@(0xC8C8C8),@"DARK":@(0x555555)},
        @"black04":@{MJColorLightKey:@(0xADADAD),@"DARK":@(0x616161)},
        @"red02":@{MJColorLightKey:@(0xf24949),@"DARK":@(0xDB3533)},
        @"yellow02":@{MJColorLightKey:@(0xFACE15),@"DARK":@(0xFEC500)},
    };
}

- (void)loadDefaultColors {
    self.Mojiblue = [self mj_appearanceColorWithName:@"Mojiblue"];
    self.page = [self mj_appearanceColorWithName:@"page"];
    self.white = [self mj_appearanceColorWithName:@"white"];
    self.black01 = [self mj_appearanceColorWithName:@"black01"];
    self.black02 = [self mj_appearanceColorWithName:@"black02"];
    self.black03 = [self mj_appearanceColorWithName:@"black03"];
    self.lightgrey = [self mj_appearanceColorWithName:@"lightgrey"];
    self.black = [self mj_appearanceColorWithName:@"black"];
    self.black04 = [self mj_appearanceColorWithName:@"black04"];
    self.black05 = [self mj_appearanceColorWithName:@"black05"];
}

- (UIColor *)mj_appearanceColorWithName:(NSString *)colorName {
    return  [MJAppearanceColor mj_appearanceColorWithThemeName:self.themeName colorName:colorName];
}

@end
