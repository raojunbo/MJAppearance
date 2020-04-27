//
//  MJAQITheme.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/27.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MJBaseTheme.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJAQITheme : MJBaseTheme
@property (nonatomic, strong) UIColor *aqiGreen01;
@property (nonatomic, strong) UIColor *aqiYellow01;
@property (nonatomic, strong) UIColor *aqiOrange01;
@property (nonatomic, strong) UIColor *aqiRed01;
@property (nonatomic, strong) UIColor *aqiPurple01;
@property (nonatomic, strong) UIColor *aqiDeepred01;

- (void)loadThemesColors;

@end

NS_ASSUME_NONNULL_END
