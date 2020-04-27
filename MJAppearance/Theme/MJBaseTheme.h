//
//  MJBaseTheme.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/27.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJBaseTheme : NSObject
@property (nonatomic, strong) NSString *themeName;
@property (nonatomic, strong) NSDictionary *colorsTableConfigure;

- (void)loadColorConfigures;

- (void)loadDefaultColors;

@end

NS_ASSUME_NONNULL_END
