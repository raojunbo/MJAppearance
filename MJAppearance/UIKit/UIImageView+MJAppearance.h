//
//  UIImageView+MJAppearance.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (MJAppearance)

- (instancetype)mj_initWithImage:(UIImage *)image;

@property (nonatomic, strong) UIColor *mj_tintColor;
@property (nonatomic, strong) UIImage *mj_image;
@property (nonatomic, assign) BOOL mj_netImageSupportDark;//本控件支持黑暗（在黑暗主题下，会加10%蒙层）
@end

NS_ASSUME_NONNULL_END
