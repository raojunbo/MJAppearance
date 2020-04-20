//
//  MJThemeData.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MJThemeData : NSObject
@property (nonatomic, strong) NSString *themeIdentifier;//主题标识(0=白天，1黑夜)
@property (nonatomic, strong) NSString *themePicPrefix;//dark_为黑夜
@property (nonatomic, strong) NSString *Mojiblue;//主题蓝
@property (nonatomic, strong) NSString *page;//底层背景色
@property (nonatomic, strong) NSString *white;//卡片背景色
@property (nonatomic, strong) NSString *black01;//标题/重要文字/tab选中颜色
@property (nonatomic, strong) NSString *black02;//tab未选中色/扩展标题
@property (nonatomic, strong) NSString *black03;//未点击状态色/辅助文字
@end

NS_ASSUME_NONNULL_END
