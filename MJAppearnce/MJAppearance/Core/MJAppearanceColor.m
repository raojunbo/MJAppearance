//
//  MJAppearanceColor.m
//  testDark
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAppearanceColor.h"
#import "MJTheme.h"
#import "MJAppearanceColorTable.h"

@interface MJAppearanceColorHandler : NSObject
@property (nonatomic, strong) NSDictionary *colorsTable;
@end
@implementation MJAppearanceColorHandler

+ (instancetype)sharedInstance {
    static MJAppearanceColorHandler *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

- (instancetype)init {
    if(self = [super init]){
         _colorsTable = [MJAppearanceColorTable colorConfigures];
    }
    return self;
}

- (UIColor *)colorWithName:(NSString *)colorName {
    NSDictionary *colorDict = [self.colorsTable objectForKey:colorName];
    if (!colorDict) {
        return nil;//颜色配置不存在
    }
    NSString *hexColorStr = [colorDict objectForKey:[MJTheme sharedInstance].currentThemeIdentifier];
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

@end


@class MJAppearanceColorHandler;
@interface MJAppearanceColor()
@end

@implementation MJAppearanceColor

//只配置颜色，不做代码修改

+ (UIColor *)mj_appearanceColorWithName:(NSString *)appearanceColorName {
    if (!appearanceColorName) {
        return nil;
    }
    UIColor *colorValue =  [[MJAppearanceColorHandler sharedInstance] colorWithName:appearanceColorName];
    colorValue.colorName = appearanceColorName;
    return colorValue;
}

//+ (UIColor *)Mojiblue {
//    return [self mj_appearanceColorWithName:@"Mojiblue"];
//}
//
//+ (UIColor *)Mojiblue2 {
//    return [self mj_appearanceColorWithName:@"Mojiblue"];
//}
//
//+ (UIColor *)page {
//    return  [self mj_appearanceColorWithName:@"page"];;
//}
//
//+ (UIColor*)white {
//    return [self mj_appearanceColorWithName:@"white"];
//}
//
//+ (UIColor *)black01 {
//    return [self mj_appearanceColorWithName:@"black01"];
//}
//
//+ (UIColor *)black02 {
//    return [self mj_appearanceColorWithName:@"black02"];
//}
//
//+ (UIColor *)black03 {
//    return [self mj_appearanceColorWithName:@"black03"];
//}

@end


