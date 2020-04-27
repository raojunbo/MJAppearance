//
//  UIButton+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIButton+MJAppearance.h"
#import <objc/runtime.h>
#import "NSObject+MJAppearance.h"
#import "UIColor+MJAppearance.h"
#import "UIImage+MJAppearance.h"
#import "MJAppearanceManager.h"
#import "MJAppearanceColor.h"
#import "MJAppearanceImage.h"

@implementation UIButton (MJAppearance)

- (void)setMj_tintColor:(UIColor *)mj_tintColor {
    if (mj_tintColor == nil) {
        return;
    }
    self.tintColor = mj_tintColor;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.tintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_tintColor];
    };
    [self.appearanceWorks setValue:colorPicker forKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)mj_tintColor {
    return self.tintColor;
}

- (void)mj_setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [self setTitleColor:color forState:state];
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        UIColor *newColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:color];
        [weakSelf mj_setTitleColor:newColor forState:state];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)mj_setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
    [self setBackgroundImage:image forState:state];
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        UIImage *newImage = [MJAppearanceImage mj_imageWithName:image.imageName];
        [weakSelf mj_setBackgroundImage:newImage forState:state];
    };
    [self.appearanceImageWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)mj_setImage:(UIImage *)image forState:(UIControlState)state {
    [self setImage:image forState:state];
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        UIImage *newImage = [MJAppearanceImage mj_imageWithName:image.imageName];
        [weakSelf mj_setImage:newImage forState:state];
    };
    [self.appearanceImageWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
