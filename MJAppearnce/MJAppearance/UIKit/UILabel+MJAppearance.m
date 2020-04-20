//
//  UILabel+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UILabel+MJAppearance.h"
#import <objc/runtime.h>
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"
#import "UIColor+MJAppearance.h"

@implementation UILabel (MJAppearance)

- (void)setMj_textColor:(UIColor *)mj_textColor {
    if (mj_textColor == nil) {
        return;
    }
    self.textColor = mj_textColor;
    MJBlockPicker colorPicker = ^(){
        self.textColor = [MJAppearanceColor mj_appearanceColorWithName:mj_textColor.colorName];
    };
    [self.appearanceWorks setValue:colorPicker forKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)mj_textColor {
    return self.textColor;
}

- (void)setMj_shadowColor:(UIColor *)mj_shadowColor {
    if (mj_shadowColor == nil) {
        return;
    }
    self.shadowColor = mj_shadowColor;
    MJBlockPicker colorPicker = ^(){
        self.shadowColor = [MJAppearanceColor mj_appearanceColorWithName:mj_shadowColor.colorName];
    };
    [self.appearanceWorks setValue:colorPicker forKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)mj_shadowColor {
    return self.shadowColor;
}

- (void)setMj_highlightedTextColor:(UIColor *)mj_highlightedTextColor {
    if (mj_highlightedTextColor == nil) {
        return;
    }
    self.highlightedTextColor = mj_highlightedTextColor;
    MJBlockPicker colorPicker = ^(){
        self.highlightedTextColor = [MJAppearanceColor mj_appearanceColorWithName:mj_highlightedTextColor.colorName];
    };
    [self.appearanceWorks setValue:colorPicker forKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)mj_highlightedTextColor {
    return self.highlightedTextColor;
}

@end
