//
//  UIColor+ColorName.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIColor+MJAppearance.h"
#import <objc/runtime.h>
#import "MJAppearanceManager.h"
@implementation UIColor (MJAppearance)
@dynamic colorName;
@dynamic alphaPicker;

- (void)setColorName:(NSString *)colorName {
    if (colorName == nil) {
        return;
    }
   objc_setAssociatedObject(self, @selector(colorName), colorName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    __weak typeof(self) weakSelf = self;
    [self setAlphaPicker:^UIColor * _Nonnull(CGFloat lightAlpha, CGFloat darkAlpha) {
        if([MJAppearanceManager sharedInstance].currentInterfaceStyle == MJUserInterfaceStyleDark){
             return [weakSelf getNewColorWith:weakSelf alpha:darkAlpha];
        }else{
             return [weakSelf getNewColorWith:weakSelf alpha:lightAlpha];
        }
    }];
}

- (NSString *)colorName {
    NSString *colorName = objc_getAssociatedObject(self, @selector(colorName));
    return colorName;
}

- (void)setAlphaPicker:(MJColorAlphaPicker)alphaPicker {
    if (alphaPicker == nil) {
          return;
      }
    objc_setAssociatedObject(self, @selector(setAlphaPicker:), [alphaPicker copy], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (MJColorAlphaPicker)alphaPicker {
    return objc_getAssociatedObject(self, @selector(setAlphaPicker:));
}

- (UIColor *)getNewColorWith:(UIColor *)color alpha:(CGFloat)newAlpha{
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    CGFloat alpha = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:newAlpha];
    return newColor;
}

//- (UIColor *)appearanceColorWithColorName:(NSString *)colorName {
//    NSDictionary *colorsPairs = [self.colorsTableConfigure objectForKey:colorName];
//
//    //如果是 iOS 13 及以后系统，使用系统的动态颜色。目的：以后最低版本到13之后，就可以把自定义方式删掉了
//    //此方法在同一个view下是不会重新调用。直接使用的最初初始化的动态颜色。
//    if (@available(iOS 13.0, *)) {
//        UIColor *dynamicColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
//            int rgbValue = [[colorsPairs objectForKey:MJColorLightKey] intValue];
//            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//                rgbValue = [[colorsPairs objectForKey:MJColorDarkKey] intValue];
//            }else {
//                rgbValue =  [[colorsPairs objectForKey:MJColorLightKey] intValue];
//            }
//
//            return [self color:rgbValue WithName:colorName];
//        }];
//        dynamicColor.colorName = colorName;
//        return dynamicColor;
//    }
//
//    //iOS13 以下使用自定义枚举判断，最低版本升级到13之后可以直接删除
//    int rgbValue = [[colorsPairs objectForKey:MJColorLightKey] intValue];
//    if ([MJAppearanceManager sharedInstance].currentInterfaceStyle == MJUserInterfaceStyleDark) {
//        rgbValue = [[colorsPairs objectForKey:MJColorDarkKey] intValue];
//    }else {
//        rgbValue =  [[colorsPairs objectForKey:MJColorLightKey] intValue];
//    }
//    return [self color:rgbValue WithName:colorName];
//}
//
//- (UIColor *)color:(NSUInteger)rgbValue WithName:(NSString *)colorName {
//    UIColor *color = UIColorFromHEX(rgbValue);
//    color.colorName = colorName;
//    return color;
//}

@end
