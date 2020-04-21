//
//  MJAppearanceColor.h
//  testDark
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+MJAppearance.h"
NS_ASSUME_NONNULL_BEGIN

@interface MJAppearanceColor : NSObject

#define MJColorWithName(name) [MJAppearanceColor mj_appearanceColorWithName:@#name]

+ (UIColor *)mj_appearanceColorWithName:(NSString *)colorName;

@end

NS_ASSUME_NONNULL_END
