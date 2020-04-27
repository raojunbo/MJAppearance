//
//  UIProgressView+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIProgressView+MJAppearance.h"
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"

@implementation UIProgressView (MJAppearance)

@dynamic mj_progressTintColorPicker;
@dynamic mj_trackTintColorPicker;

- (void)setMj_trackTintColorPicker:(UIColor *)mj_trackTintColorPicker {
    if (mj_trackTintColorPicker == nil) {
        return;
    }
    self.mj_trackTintColorPicker = mj_trackTintColorPicker;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.tintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_trackTintColorPicker];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_progressTintColorPicker:(UIColor *)mj_progressTintColorPicker {
    if (mj_progressTintColorPicker) {
        return;
    }
    self.mj_progressTintColorPicker = mj_progressTintColorPicker;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.tintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_progressTintColorPicker];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
