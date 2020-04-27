//
//  MJAppearanceColor.h
//  testDark
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+MJAppearance.h"
#import "MJAQITheme.h"
#import "MJMainTheme.h"
NS_ASSUME_NONNULL_BEGIN

static NSString * const MJColorLightKey = @"LIGHT";
static NSString * const MJColorDarkKey = @"DARK";

#define MJColor [MJAppearanceColor sharedInstance]

@interface MJAppearanceColor : NSObject

@property (nonatomic, strong) MJMainTheme *mainTheme;
@property (nonatomic, strong) MJAQITheme *aqiTheme;

+ (instancetype)sharedInstance;

+ (UIColor *)mj_appearanceColorWithThemeName:(NSString *)themeName colorName:(NSString *)colorName;

+ (UIColor *)mj_appearanceColorWithOriginColor:(UIColor *)originColor;

+ (UIColor *)mj_appearanceColorWithOriginColor:(UIColor *)originColor lightAlpha:(CGFloat)lightAlpha darkAlpha:(CGFloat)darkAlpha;

@end

NS_ASSUME_NONNULL_END
