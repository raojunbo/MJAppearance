//
//  NSObject+MJAppearance.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^MJBlockPicker)(void);

@interface NSObject (MJAppearance)
@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *appearanceWorks;//用于存储信息(图片，或者颜色)
@property (class, nonatomic, strong,readonly) NSHashTable *objectWeakHashTable;//全局hashTable用于存需要更新的View的weak指针。

- (void)mj_updateAppearanceColor;

@end

NS_ASSUME_NONNULL_END
