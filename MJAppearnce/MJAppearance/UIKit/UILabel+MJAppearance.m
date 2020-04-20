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

@implementation UILabel (MJAppearance)

- (void)setMj_textColor:(UIColor *)mj_textColor {
    if (mj_textColor == nil) {
        return;
    }
    self.textColor = mj_textColor;
    [self.appearanceWorks setValue:mj_textColor forKey:@"mj_textColor"];
    [self needUpdateConfige];
}

- (UIColor *)mj_textColor {
    return [self.appearanceWorks objectForKey:@"mj_textColor"];
}

- (void)setMj_shadowColor:(UIColor *)mj_shadowColor {
    if (mj_shadowColor == nil) {
        return;
    }
    self.textColor = mj_shadowColor;
    [self.appearanceWorks setValue:mj_shadowColor forKey:@"mj_shadowColor"];
    [self needUpdateConfige];
}

- (UIColor *)mj_shadowColor {
    return [self.appearanceWorks objectForKey:@"mj_shadowColor"];
}

- (void)setMj_highlightedTextColor:(UIColor *)mj_highlightedTextColor {
    if (mj_highlightedTextColor == nil) {
        return;
    }
    self.highlightedTextColor = mj_highlightedTextColor;
    [self.appearanceWorks setValue:mj_highlightedTextColor forKey:@"mj_highlightedTextColor"];
    [self needUpdateConfige];
}

- (UIColor *)mj_highlightedTextColor {
    return  [self.appearanceWorks objectForKey:@"mj_highlightedTextColor"];
}

@end
