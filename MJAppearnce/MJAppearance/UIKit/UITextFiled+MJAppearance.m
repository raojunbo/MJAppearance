//
//  UITextFiled+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UITextFiled+MJAppearance.h"
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"
#import "MJAppearanceImage.h"
#import "MJAppearanceManager.h"

@implementation UITextField (MJAppearance)
@dynamic mj_textColor;
- (void)setMj_textColor:(UIColor *)mj_textColor {
    if (mj_textColor == nil) {
        return;
    }
    self.textColor = mj_textColor;
    MJBlockPicker colorPicker = ^(){
        self.textColor = [MJColor mj_appearanceColorWithName:mj_textColor.colorName];
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end