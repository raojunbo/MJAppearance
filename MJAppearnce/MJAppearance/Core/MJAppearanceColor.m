//
//  MJAppearanceColor.m
//  testDark
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAppearanceColor.h"
#import "MJTheme.h"
#import "NSObject+MJAppearance.h"
#import "UIColor+MJAppearance.h"
#import "UIView+MJAppearance.h"
#import "UIButton+MJAppearance.h"

@interface MJAppearanceColor()
@end

@implementation MJAppearanceColor

+ (UIColor *)mj_appearanceColorWithName:(NSString *)appearanceColorName {
    if (!appearanceColorName) {
        return nil;
    }
    NSString *colorHexValue = [[MJTheme sharedInstance].currentTheme valueForKey:appearanceColorName];
    UIColor *colorValue =  [self.class mjlw_colorFromHexString:colorHexValue alpha:1];
    colorValue.colorName = appearanceColorName;
    return colorValue;
}

+ (UIColor *)Mojiblue {
    return [self mj_appearanceColorWithName:@"Mojiblue"];
}

+ (UIColor *)page {
    return  [self mj_appearanceColorWithName:@"page"];;
}

+ (UIColor*)white {
    return [self mj_appearanceColorWithName:@"white"];
}

+ (UIColor *)black01 {
    return [self mj_appearanceColorWithName:@"black01"];
}

+ (UIColor *)black02 {
    return [self mj_appearanceColorWithName:@"black02"];
}

+ (UIColor *)black03 {
    return [self mj_appearanceColorWithName:@"black03"];
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

@end
