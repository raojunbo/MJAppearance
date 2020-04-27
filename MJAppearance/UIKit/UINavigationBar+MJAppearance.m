//
//  UINavigationBar+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UINavigationBar+MJAppearance.h"
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"

@implementation UINavigationBar (MJAppearance)
@dynamic mj_tintColor;
@dynamic mj_barTintColor;

- (void)setMj_tintColor:(UIColor *)mj_tintColor {
    if (mj_tintColor == nil) {
        return;
    }
    self.tintColor = mj_tintColor;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.tintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_tintColor];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];;
}

- (UIColor *)mj_tintColor {
    return self.tintColor;
}

- (void)setMj_barTintColor:(UIColor *)mj_barTintColor {
    if (mj_barTintColor == nil) {
        return;
    }
    self.barTintColor = mj_barTintColor;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.barTintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_barTintColor];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];;
}

- (UIColor *)mj_barTintColor {
    return self.barTintColor;;
}



@end
