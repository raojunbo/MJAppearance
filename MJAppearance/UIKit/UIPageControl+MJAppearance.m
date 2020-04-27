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
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.pageIndicatorTintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_pageIndicatorTintColor];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (void)setMj_currentPageIndicatorTintColor:(UIColor *)mj_currentPageIndicatorTintColor {
    if (mj_currentPageIndicatorTintColor == nil) {
        return;
    }
    self.pageIndicatorTintColor = mj_currentPageIndicatorTintColor;
    __weak typeof(self) weakSelf = self;
    MJBlockPicker colorPicker = ^(){
        weakSelf.pageIndicatorTintColor = [MJAppearanceColor mj_appearanceColorWithOriginColor:mj_currentPageIndicatorTintColor];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

@end
