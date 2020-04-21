//
//  UITableView+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UITableView+MJAppearance.h"
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"

@implementation UITableView (MJAppearance)
@dynamic mj_separatorColor;
@dynamic mj_sectionIndexColor;
@dynamic mj_sectionIndexBackgroundColor;
@dynamic mj_sectionIndexTrackingBackgroundColor;

- (void)setMj_separatorColor:(UIColor *)mj_separatorColor {
    if(mj_separatorColor == nil){
        return;
    }
    self.separatorColor = mj_separatorColor;
    MJBlockPicker colorPicker = ^(){
        self.separatorColor = [MJAppearanceColor mj_appearanceColorWithName:mj_separatorColor.colorName];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
    
}

- (void)setMj_sectionIndexColor:(UIColor *)mj_sectionIndexColor {
    if (mj_sectionIndexColor == nil) {
        return;
    }
    self.sectionIndexColor = mj_sectionIndexColor;
    MJBlockPicker colorPicker = ^(){
        self.separatorColor = [MJAppearanceColor mj_appearanceColorWithName:mj_sectionIndexColor.colorName];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_sectionIndexBackgroundColor:(UIColor *)mj_sectionIndexBackgroundColor {
    if (mj_sectionIndexBackgroundColor == nil) {
        return;
    }
    self.sectionIndexBackgroundColor = mj_sectionIndexBackgroundColor;
    MJBlockPicker colorPicker = ^(){
        self.separatorColor = [MJAppearanceColor mj_appearanceColorWithName:mj_sectionIndexBackgroundColor.colorName];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_sectionIndexTrackingBackgroundColor:(UIColor *)mj_sectionIndexTrackingBackgroundColor {
    if (mj_sectionIndexTrackingBackgroundColor == nil) {
        return;
    }
    self.sectionIndexBackgroundColor = mj_sectionIndexTrackingBackgroundColor;
    MJBlockPicker colorPicker = ^(){
        self.separatorColor = [MJAppearanceColor mj_appearanceColorWithName:mj_sectionIndexTrackingBackgroundColor.colorName];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
