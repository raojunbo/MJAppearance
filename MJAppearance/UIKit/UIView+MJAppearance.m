//
//  UIView+ThemeWeakHashTable.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIView+MJAppearance.h"
#import <objc/runtime.h>
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"
#import "MJAppearanceImage.h"
#import "MJAppearanceManager.h"
//#import "UIColor+MJAppearance.h"
//#import "UIImage+MJAppearance.h"

@interface UIView ()

@end

@implementation UIView (MJAppearance)

+ (void)load {
    Method orgMet = class_getInstanceMethod([self class], @selector(didMoveToSuperview));
    Method newMet = class_getInstanceMethod([self class], @selector(mj_didMoveToSuperview));
    if (!orgMet || !newMet) {
        return ;
    }
    method_exchangeImplementations(orgMet, newMet);
}

- (void)setMj_backgroundColor:(UIColor *)mj_backgroundColor {
    if (mj_backgroundColor == nil) {
        return;
    }
    self.backgroundColor = mj_backgroundColor;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.backgroundColor = [MJColor mj_appearanceColorWithName:mj_backgroundColor.colorName];
    };
    [self.appearanceWorks setValue:colorPicker forKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)mj_backgroundColor {
    return self.backgroundColor;
}

- (void)mj_didMoveToSuperview {
    [self mj_didMoveToSuperview];
    //将显示到屏幕上的view添加到weak表中，便于真正需要刷新的视图更新
    [[self class].objectWeakHashTable addObject:self];
}

@end
