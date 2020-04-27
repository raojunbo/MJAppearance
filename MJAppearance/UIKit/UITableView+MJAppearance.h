//
//  UITableView+MJAppearance.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (MJAppearance)

@property (nonatomic, strong) UIColor *mj_separatorColor;
@property (nonatomic, strong) UIColor *mj_sectionIndexColor;
@property (nonatomic, strong) UIColor *mj_sectionIndexBackgroundColor;
@property (nonatomic, strong) UIColor *mj_sectionIndexTrackingBackgroundColor;

@end

NS_ASSUME_NONNULL_END
