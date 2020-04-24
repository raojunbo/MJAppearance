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
    MJBlockPicker colorPicker = ^(){
        self.tintColor = [MJColor mj_appearanceColorWithName:mj_tintColor.colorName];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_thumbTintColor:(UIColor *)mj_thumbTintColor {
    if (mj_thumbTintColor) {
        return;
    }
    self.thumbTintColor = [MJColor mj_appearanceColorWithName:mj_thumbTintColor.colorName];
    MJBlockPicker colorPicker = ^(){
           self.tintColor = [MJColor mj_appearanceColorWithName:mj_thumbTintColor.colorName];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}


@end
