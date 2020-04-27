//
//  UIBarButtonItem+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIBarButtonItem+MJAppearance.h"
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"

@implementation UIBarButtonItem (MJAppearance)
@dynamic mj_tintColor;

- (void)setMj_tintColor:(UIColor *)mj_tintColor {
    if(mj_tintColor == nil){
        return;
    }
    self.tintColor = mj_tintColor;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.tintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_tintColor];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
