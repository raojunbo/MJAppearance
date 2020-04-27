//
//  MJMainTheme.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/27.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJBaseTheme.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJMainTheme : MJBaseTheme
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

- (void)loadThemesColors;

@end

NS_ASSUME_NONNULL_END
