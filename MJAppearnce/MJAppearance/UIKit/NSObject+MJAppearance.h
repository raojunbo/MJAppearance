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

static NSString *KAppAppearanceChangeNotifcation = @"KAppAppearanceChangeNotifcation";

typedef void (^MJAppearanceUpdate)(void);

@interface NSObject (MJAppearance)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *appearanceUpdates;//用于更新
@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *appearanceWorks;//用于存储信息(图片，或者颜色)
@property (class, nonatomic, strong,readonly) NSHashTable *objectWeakHashTable;//全局hashTable用于存需要更新的View的weak指针。

- (void)addObjectToWeakHashTable:(id)object;

- (void)needUpdateConfige;

@end

NS_ASSUME_NONNULL_END
