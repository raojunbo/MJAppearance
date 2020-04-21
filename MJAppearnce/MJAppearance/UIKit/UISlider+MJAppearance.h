//
//  UISlider+MJAppearance.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISlider (MJAppearance)

@property(nullable, nonatomic,strong) UIColor *mj_minimumTrackTintColor;
@property(nullable, nonatomic,strong) UIColor *mj_maximumTrackTintColor;
@property(nullable, nonatomic,strong) UIColor *mj_thumbTintColor;
@end

NS_ASSUME_NONNULL_END
