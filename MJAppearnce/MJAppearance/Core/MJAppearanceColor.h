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

//主色
@property (nonatomic, strong) UIColor *Mojiblue;//主题蓝
@property (nonatomic, strong) UIColor *page;//底层背景色
@property (nonatomic, strong) UIColor *white;//卡片背景色
@property (nonatomic, strong) UIColor *black01;//标题
@property (nonatomic, strong) UIColor *black02;//主辅字
@property (nonatomic, strong) UIColor *black03;//次辅字
@property (nonatomic, strong) UIColor *lightgrey;//搜索框底色,设置页粗栏条
@property (nonatomic, strong) UIColor *black;//分割线
@property (nonatomic, strong) UIColor *black05;//底部提示信息
@property (nonatomic, strong) UIColor *black04;


//业务色
@property (nonatomic, strong) UIColor *red02;//点赞，信息气泡
@property (nonatomic, strong) UIColor *yellow02;//收藏

@end

NS_ASSUME_NONNULL_END
