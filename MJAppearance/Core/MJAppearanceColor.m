//
//  MJAppearanceColor.m
//  testDark
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAppearanceColor.h"
#import "MJAppearanceManager.h"

#define UIColorFromHEX(rgbValue,alpha) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:alpha]

static NSString * const MJColorLightKey = @"LIGHT";
static NSString * const MJColorDarkKey = @"DARK";

@interface MJAppearanceColor()
@property (nonatomic, strong) NSDictionary *colorsTableConfigure;
@property (nonatomic, strong) NSCache *lightColorCache;
@property (nonatomic, strong) NSCache *darkColorCache;
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
        [self loadDefaultColors];
    }
    return self;
}

/* 添加新类型颜色：1.loadColorConfigures 配置相应的LIGHT与DARK色
 2.loadDefaultColors 根据初始读取初始值
 **/
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
    self.red02 = [self mj_appearanceColorWithName:@"red02"];
    self.yellow02 = [self mj_appearanceColorWithName:@"yellow02"];
}

+ (UIColor *)mj_appearanceColorWithOriginColor:(UIColor *)originColor {
    return [[self sharedInstance] appearanceColorWithColorName:originColor.colorName lightAlpha:originColor.lightAlpha darkAlpah:originColor.darkAlpha];
}

+ (UIColor *)mj_appearanceColorWithOriginColor:(UIColor *)originColor lightAlpha:(CGFloat)lightAlpha darkAlpha:(CGFloat)darkAlpha {
    return [[self sharedInstance] appearanceColorWithColorName:originColor.colorName lightAlpha:lightAlpha darkAlpah:darkAlpha];
}


- (UIColor *)mj_appearanceColorWithName:(NSString *)appearanceColorName {
    UIColor *color = [self appearanceColorWithColorName:appearanceColorName lightAlpha:1 darkAlpah:1];
    return color;
}

- (UIColor *)appearanceColorWithColorName:(NSString *)colorName lightAlpha:(CGFloat)lightAlpah darkAlpah:(CGFloat)darkApha {
    NSDictionary *colorsPairs = [self.colorsTableConfigure objectForKey:colorName];
    
    //如果是 iOS 13 及以后系统，使用系统的动态颜色。目的：以后最低版本到13之后，就可以把自定义方式删掉了
    //此方法在同一个view下是不会重新调用。直接使用的最初初始化的动态颜色。
    
    
    if (@available(iOS 13.0, *)) {
        UIColor *dynamicColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            int rgbValue = [[colorsPairs objectForKey:MJColorLightKey] intValue];
            CGFloat alpha = lightAlpah;
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                rgbValue = [[colorsPairs objectForKey:MJColorDarkKey] intValue];
                alpha = darkApha;
            }else {
                rgbValue =  [[colorsPairs objectForKey:MJColorLightKey] intValue];
                alpha = lightAlpah;
            }
            
            return [self color:rgbValue WithName:colorName alpha:alpha];
        }];
        dynamicColor.colorName = colorName;
        dynamicColor.darkAlpha = darkApha;
        dynamicColor.lightAlpha = lightAlpah;
        
        return dynamicColor;
    }
    
    //iOS13 以下使用自定义枚举判断，最低版本升级到13之后可以直接删除
    int rgbValue = [[colorsPairs objectForKey:MJColorLightKey] intValue];
      CGFloat alpha = lightAlpah;
    if ([MJAppearanceManager sharedInstance].currentInterfaceStyle == MJUserInterfaceStyleDark) {
        rgbValue = [[colorsPairs objectForKey:MJColorDarkKey] intValue];
        alpha = darkApha;
    }else {
        rgbValue =  [[colorsPairs objectForKey:MJColorLightKey] intValue];
        alpha = lightAlpah;
    }
    UIColor *color  = [self color:rgbValue WithName:colorName alpha:alpha];
    color.darkAlpha = darkApha;
    color.lightAlpha = lightAlpah;
    return color;
}

- (UIColor *)color:(NSUInteger)rgbValue WithName:(NSString *)colorName alpha:(CGFloat)alpha {
    UIColor *color = UIColorFromHEX(rgbValue,alpha);
    color.colorName = colorName;
    return color;
}

@end


