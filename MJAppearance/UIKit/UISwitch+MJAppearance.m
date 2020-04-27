//
//  UISwitch+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UISwitch+MJAppearance.h"
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"

@implementation UISwitch (MJAppearance)
@dynamic mj_onTintColor;
@dynamic mj_thumbTintColor;
- (void)setMj_onTintColor:(UIColor *)mj_tintColor {
    if (mj_tintColor) {
        return;
    }
    self.onTintColor = mj_tintColor;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.tintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_tintColor];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_thumbTintColor:(UIColor *)mj_thumbTintColor {
    if (mj_thumbTintColor) {
        return;
    }
    __weak typeof(self) weakSelf = self;
    self.thumbTintColor = mj_thumbTintColor;
    MJBlockPicker colorPicker = ^(){
        weakSelf.tintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_thumbTintColor];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}


@end
