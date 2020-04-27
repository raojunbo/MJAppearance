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
    
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.separatorColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_separatorColor];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}



- (void)setMj_sectionIndexColor:(UIColor *)mj_sectionIndexColor {
    if (mj_sectionIndexColor == nil) {
        return;
    }
    self.sectionIndexColor = mj_sectionIndexColor;
    __weak typeof(self) weakSelf = self;
    
    MJBlockPicker colorPicker = ^(){
        weakSelf.separatorColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_sectionIndexColor];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_sectionIndexBackgroundColor:(UIColor *)mj_sectionIndexBackgroundColor {
    if (mj_sectionIndexBackgroundColor == nil) {
        return;
    }
    self.sectionIndexBackgroundColor = mj_sectionIndexBackgroundColor;
    __weak typeof(self) weakSelf = self;
    
    MJBlockPicker colorPicker = ^(){
        weakSelf.separatorColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_sectionIndexBackgroundColor];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_sectionIndexTrackingBackgroundColor:(UIColor *)mj_sectionIndexTrackingBackgroundColor {
    if (mj_sectionIndexTrackingBackgroundColor == nil) {
        return;
    }
    self.sectionIndexBackgroundColor = mj_sectionIndexTrackingBackgroundColor;
    __weak typeof(self) weakSelf = self;
    
    MJBlockPicker colorPicker = ^(){
        weakSelf.separatorColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_sectionIndexTrackingBackgroundColor];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
