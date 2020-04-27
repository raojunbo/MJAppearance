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
@property (nonatomic, strong) NSString *colorName;
@property (nonatomic, strong) MJColorAlphaPicker alphaPicker;
@end

NS_ASSUME_NONNULL_END
