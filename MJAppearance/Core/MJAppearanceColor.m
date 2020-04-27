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


@interface MJAppearanceColor()
@property (nonatomic, strong) NSMapTable *weakThemeMapTable;

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
      _weakThemeMapTable = [NSMapTable mapTableWithKeyOptions:NSMapTableStrongMemory valueOptions:NSMapTableWeakMemory];
    }
    return self;
}

+ (UIColor *)mj_appearanceColorWithThemeName:(NSString *)themeName colorName:(NSString *)colorName {
   return [[self sharedInstance] appearanceColorWithTheme:themeName colorName:colorName lightAlpha:1 darkAlpah:1];
}

+ (UIColor *)mj_appearanceColorWithOriginColor:(UIColor *)originColor {
    return [[self sharedInstance] appearanceColorWithTheme:originColor.themeName colorName:originColor.colorName lightAlpha:originColor.lightAlpha darkAlpah:originColor.darkAlpha];
}

+ (UIColor *)mj_appearanceColorWithOriginColor:(UIColor *)originColor lightAlpha:(CGFloat)lightAlpha darkAlpha:(CGFloat)darkAlpha {
    return [[self sharedInstance] appearanceColorWithTheme:originColor.themeName colorName:originColor.colorName lightAlpha:lightAlpha darkAlpah:darkAlpha];
}

- (UIColor *)appearanceColorWithTheme:(NSString *)themeName colorName:(NSString *)colorName lightAlpha:(CGFloat)lightAlpah darkAlpah:(CGFloat)darkApha {
  
    MJBaseTheme *theme = [self.weakThemeMapTable objectForKey:themeName];
    NSDictionary *colorsPairs = [theme.colorsTableConfigure  objectForKey:colorName];
    
    //如果是 iOS 13 及以后系统，使用系统的动态颜色。目的：以后最低版本到13之后，就可以把自定义方式删掉了
    //此方法在同一个view下是不会重新调用。直接使用的最初初始化的动态颜色。
    //    typedef UIColor *_Nonnull(^MJColorAlphaPicker)(CGFloat lightAlpha,CGFloat darkAlpha);
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
        dynamicColor.darkAlpha = darkApha;
        dynamicColor.lightAlpha = lightAlpah;
        dynamicColor.themeName = themeName;
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
    color.themeName = themeName;
    return color;
}

- (UIColor *)color:(NSUInteger)rgbValue WithName:(NSString *)colorName alpha:(CGFloat)alpha {
    UIColor *color = UIColorFromHEX(rgbValue,alpha);
    color.colorName = colorName;
    return color;
}

- (MJMainTheme *)mainTheme {
    if(!_mainTheme){
        _mainTheme = [[MJMainTheme alloc]init];
        [self.weakThemeMapTable setObject:_mainTheme forKey:_mainTheme.themeName];
        [_mainTheme loadThemesColors];
    }
    return _mainTheme;
}

- (MJAQITheme *)aqiTheme {
    if(!_aqiTheme){
        _aqiTheme = [[MJAQITheme alloc]init];
        [self.weakThemeMapTable setObject:_mainTheme forKey:_mainTheme.themeName];
    }
    return _aqiTheme;
}

@end


