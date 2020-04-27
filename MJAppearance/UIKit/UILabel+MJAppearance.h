//
//  UILabel+MJAppearance.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (MJAppearance)

@property (nonatomic, strong) UIColor *mj_textColor;
@property (nonatomic, strong) UIColor *mj_shadowColor;
@property (nonatomic, strong) UIColor *mj_highlightedTextColor;
@end

NS_ASSUME_NONNULL_END
