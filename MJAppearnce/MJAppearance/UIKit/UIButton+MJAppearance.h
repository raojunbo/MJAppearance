//
//  UIButton+MJAppearance.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (MJAppearance)

@property (nonatomic,strong) UIColor *mj_tintColor;

- (void)mj_setTitleColor:(UIColor *)color forState:(UIControlState)state;
- (void)mj_setBackgroundImage:(UIImage *)image forState:(UIControlState)state;
- (void)mj_setImage:(UIImage *)image forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END

