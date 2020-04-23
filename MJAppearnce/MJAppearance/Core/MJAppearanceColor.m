//
//  MJAppearanceColor.m
//  testDark
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAppearanceColor.h"
#import "MJAppearanceManager.h"

@interface MJAppearanceColor()
@property (nonatomic, strong) NSDictionary *colorConfigures;
@end

@implementation MJAppearanceColor

+ (instancetype)sharedInstance {
    static MJAppearanceColor *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

- (instancetype)init {
    if(self = [super init]){
        [self loadColorConfigures];
    }
    return self;
}

- (UIColor *)colorWithName:(NSString *)colorName {
    NSDictionary *colorDict = [self.colorConfigures objectForKey:colorName];
    if (!colorDict) {
        return nil;//颜色配置不存在
    }
    NSString *hexColorStr = [colorDict objectForKey:[MJAppearanceManager sharedInstance].currentAppearanceColorKey];
    if (hexColorStr == nil) {
      hexColorStr = [colorDict objectForKey:MJAppearanceManagerColorLightKey];
    }
    UIColor *newColor = [self.class mjlw_colorFromHexString:hexColorStr alpha:1];
    newColor.colorName = colorName;
    return newColor;
}

+ (UIColor *)mjlw_colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha {
   unsigned rgbValue = 0;
       hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
       NSScanner *scanner = [NSScanner scannerWithString:hexString];
       [scanner scanHexInt:&rgbValue];
       return [[self class] colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:1.0];
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

- (UIColor *)mj_appearanceColorWithName:(NSString *)appearanceColorName {
    return [self colorWithName:appearanceColorName];
}

- (void)loadColorConfigures {
    self.colorConfigures = @{
        @"Mojiblue":@{
                MJAppearanceManagerColorLightKey:@"#4294EA",MJAppearanceManagerColorDarkKey:@"#0576E6"
        },
        @"page":@{
                MJAppearanceManagerColorLightKey:@"#EEF1F4",MJAppearanceManagerColorDarkKey:@"#1A1A1A"
        },
        @"white":@{
                MJAppearanceManagerColorLightKey:@"#FFFFFF",MJAppearanceManagerColorDarkKey:@"#2B2B2D"
        },
        @"black01":@{
                MJAppearanceManagerColorLightKey:@"#212223",MJAppearanceManagerColorDarkKey:@"#DDDDDF"
        },
        @"black02":@{
                MJAppearanceManagerColorLightKey:@"#666666",MJAppearanceManagerColorDarkKey:@"#8E8E92"
        },
        @"black03":@{
                MJAppearanceManagerColorLightKey:@"#999999",MJAppearanceManagerColorDarkKey:@"#616161"
        },
    };
}

- (UIColor *)Mojiblue {
    return [self mj_appearanceColorWithName:NSStringFromSelector(_cmd)];
}

- (UIColor *)page {
      return [self mj_appearanceColorWithName:NSStringFromSelector(_cmd)];
}

- (UIColor *)white {
     return [self mj_appearanceColorWithName:NSStringFromSelector(_cmd)];
}

- (UIColor *)black01 {
     return [self mj_appearanceColorWithName:NSStringFromSelector(_cmd)];
}

- (UIColor *)black02 {
     return [self mj_appearanceColorWithName:NSStringFromSelector(_cmd)];
}

- (UIColor *)black03 {
     return [self mj_appearanceColorWithName:NSStringFromSelector(_cmd)];
}

- (UIColor *)red {
     return [self mj_appearanceColorWithName:NSStringFromSelector(_cmd)];
}

@end


