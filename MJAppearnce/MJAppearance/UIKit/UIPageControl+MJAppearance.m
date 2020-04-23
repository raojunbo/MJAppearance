//
//  UIPageControl+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIPageControl+MJAppearance.h"
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"

@implementation UIPageControl (MJAppearance)
@dynamic mj_pageIndicatorTintColor;
@dynamic mj_currentPageIndicatorTintColor;

- (void)setMj_pageIndicatorTintColor:(UIColor *)mj_pageIndicatorTintColor {
    if (mj_pageIndicatorTintColor == nil) {
        return;
    }
    self.pageIndicatorTintColor = mj_pageIndicatorTintColor;
    MJBlockPicker colorPicker = ^(){
        self.pageIndicatorTintColor = [MJColor mj_appearanceColorWithName:mj_pageIndicatorTintColor.colorName];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_currentPageIndicatorTintColor:(UIColor *)mj_currentPageIndicatorTintColor {
    if (mj_currentPageIndicatorTintColor == nil) {
        return;
    }
    self.pageIndicatorTintColor = mj_currentPageIndicatorTintColor;
    MJBlockPicker colorPicker = ^(){
        self.pageIndicatorTintColor = [MJColor mj_appearanceColorWithName:mj_currentPageIndicatorTintColor.colorName];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
