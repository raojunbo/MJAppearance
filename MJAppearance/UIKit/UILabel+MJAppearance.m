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
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.textColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_textColor];
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
    
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.shadowColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_shadowColor];
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
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.highlightedTextColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_highlightedTextColor];
    };
    [self.appearanceWorks setValue:colorPicker forKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)mj_highlightedTextColor {
    return self.highlightedTextColor;
}

@end
