//
//  UISlider+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UISlider+MJAppearance.h"
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"

@implementation UISlider (MJAppearance)
@dynamic mj_minimumTrackTintColor;
@dynamic mj_maximumTrackTintColor;
@dynamic mj_thumbTintColor;

- (void)setMj_minimumTrackTintColor:(UIColor *)mj_minimumTrackTintColor {
    if (mj_minimumTrackTintColor == nil) {
        return;
    }
    self.minimumTrackTintColor = mj_minimumTrackTintColor;
    MJBlockPicker colorPicker = ^(){
        self.mj_minimumTrackTintColor = [MJColor mj_appearanceColorWithName:mj_minimumTrackTintColor.colorName];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_maximumTrackTintColor:(UIColor *)mj_maximumTrackTintColor {
    if (mj_maximumTrackTintColor == nil) {
        return;
    }
    self.maximumTrackTintColor = mj_maximumTrackTintColor;
    MJBlockPicker colorPicker = ^(){
        self.mj_maximumTrackTintColor = [MJColor mj_appearanceColorWithName:mj_maximumTrackTintColor.colorName];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_thumbTintColor:(UIColor *)mj_thumbTintColor {
    if (mj_thumbTintColor == nil) {
        return;
    }
    self.thumbTintColor = mj_thumbTintColor;
    MJBlockPicker colorPicker = ^(){
        self.thumbTintColor = [MJColor mj_appearanceColorWithName:mj_thumbTintColor.colorName];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
