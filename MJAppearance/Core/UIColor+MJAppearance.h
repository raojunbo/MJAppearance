//
//  UIColor+ColorName.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIColor *_Nonnull(^MJColorAlphaPicker)(CGFloat lightAlpha,CGFloat darkAlpha);

@interface UIColor (MJAppearance)
@property (nonatomic, strong) NSString *themeName;//所属主题
@property (nonatomic, strong) NSString *colorName;//颜色名
@property (nonatomic, assign) CGFloat lightAlpha;//白天alpha
@property (nonatomic, assign) CGFloat darkAlpha;//黑夜alpha

@property (nonatomic, strong) MJColorAlphaPicker alphaPicker;

@end

NS_ASSUME_NONNULL_END
