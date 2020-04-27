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
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.minimumTrackTintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_minimumTrackTintColor];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_maximumTrackTintColor:(UIColor *)mj_maximumTrackTintColor {
    if (mj_maximumTrackTintColor == nil) {
        return;
    }
    self.maximumTrackTintColor = mj_maximumTrackTintColor;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.maximumTrackTintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_maximumTrackTintColor];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_thumbTintColor:(UIColor *)mj_thumbTintColor {
    if (mj_thumbTintColor == nil) {
        return;
    }
    self.thumbTintColor = mj_thumbTintColor;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.thumbTintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_thumbTintColor];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
