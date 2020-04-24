//
//  MJAppearanceManager.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

static NSString * const KAppMJAppearanceChangeNotifcation = @"KAppMJAppearanceChangeNotifcation";

typedef NS_ENUM(NSInteger, MJUserInterfaceStyle) {
    MJUserInterfaceStyleLight,
    MJUserInterfaceStyleDark
};

@interface MJAppearanceManager : NSObject

@property (nonatomic, strong,readonly) NSString *darkInterfaceStylePicSuffix;

@property (nonatomic, assign) MJUserInterfaceStyle currentInterfaceStyle;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
