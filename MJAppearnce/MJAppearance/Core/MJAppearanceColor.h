//
//  MJAppearanceColor.h
//  testDark
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJAppearanceColor : NSObject

+ (UIColor *)mj_appearanceColorWithName:(NSString *)colorName;

+ (UIColor *)Mojiblue;
+ (UIColor *)page;
+ (UIColor *)white;
+ (UIColor *)black01;
+ (UIColor *)black02;
+ (UIColor *)black03;

@end

NS_ASSUME_NONNULL_END
