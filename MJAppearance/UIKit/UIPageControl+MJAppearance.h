//
//  UIPageControl+MJAppearance.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIPageControl (MJAppearance)

@property (nonatomic, strong) UIColor *mj_pageIndicatorTintColor;
@property (nonatomic, strong) UIColor *mj_currentPageIndicatorTintColor;

@end

NS_ASSUME_NONNULL_END
