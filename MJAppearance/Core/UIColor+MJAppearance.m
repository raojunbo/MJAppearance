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
#import "MJAppearanceColor.h"

@implementation UIColor (MJAppearance)
@dynamic colorName;
@dynamic alphaPicker;
@dynamic lightAlpha;
@dynamic darkAlpha;

- (void)setColorName:(NSString *)colorName {
    if (colorName == nil) {
        return;
    }
    objc_setAssociatedObject(self, @selector(colorName), colorName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    __weak typeof(self) weakSelf = self;
    [self setAlphaPicker:^UIColor * _Nonnull(CGFloat lightAlpha, CGFloat darkAlpha) {
        return [MJAppearanceColor mj_appearanceColorWithOriginColor:weakSelf lightAlpha:lightAlpha darkAlpha:darkAlpha];;
    }];
}

- (NSString *)colorName {
    NSString *colorName = objc_getAssociatedObject(self, @selector(colorName));
    return colorName;
}

- (void)setLightAlpha:(CGFloat)lightAlpha {
    objc_setAssociatedObject(self, @selector(setLightAlpha:), @(lightAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lightAlpha {
    NSNumber *alpha = objc_getAssociatedObject(self, @selector(setLightAlpha:));
    return alpha.floatValue;
}

- (void)setDarkAlpha:(CGFloat)darkAlpha {
    objc_setAssociatedObject(self, @selector(setDarkAlpha:), @(darkAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)darkAlpha {
    NSNumber *alpha = objc_getAssociatedObject(self, @selector(setDarkAlpha:));
    return alpha.floatValue;
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

@end
