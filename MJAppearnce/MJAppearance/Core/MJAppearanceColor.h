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

#define MJColor [MJAppearanceColor sharedInstance]

+ (instancetype)sharedInstance;
- (UIColor *)mj_appearanceColorWithName:(NSString *)colorName;

@property (nonatomic, strong) UIColor *Mojiblue;
@property (nonatomic, strong) UIColor *page;
@property (nonatomic, strong) UIColor *white;
@property (nonatomic, strong) UIColor *black01;
@property (nonatomic, strong) UIColor *black02;
@property (nonatomic, strong) UIColor *black03;
@property (nonatomic, strong) UIColor *red;
@end

NS_ASSUME_NONNULL_END
