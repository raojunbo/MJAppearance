//
//  UISearchBar+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UISearchBar+MJAppearance.h"
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"

@implementation UISearchBar (MJAppearance)
@dynamic mj_barTintColor;

- (void)setMj_barTintColor:(UIColor *)mj_barTintColor {
    if (mj_barTintColor == nil) {
        return;
    }
    MJBlockPicker colorPicker = ^(){
        self.barTintColor = [MJAppearanceColor mj_appearanceColorWithName:mj_barTintColor.colorName];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
