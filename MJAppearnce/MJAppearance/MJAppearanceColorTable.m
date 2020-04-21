//
//  MJAppearanceColorTable.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAppearanceColorTable.h"
#import "MJTheme.h"


@implementation MJAppearanceColorTable

+ (NSDictionary *)colorConfigures {
    return @{
        @"Mojiblue":@{
                MJThemeIdentifierNormal:@"#4294EA",MJThemeIdentifierDark:@"#0576E6"
        },
        @"page":@{
                MJThemeIdentifierNormal:@"#EEF1F4",MJThemeIdentifierDark:@"#1A1A1A"
        },
        @"white":@{
                MJThemeIdentifierNormal:@"#FFFFFF",MJThemeIdentifierDark:@"#2B2B2D"
        },
        @"black01":@{
                MJThemeIdentifierNormal:@"#212223",MJThemeIdentifierDark:@"#DDDDDF"
        },
        @"black02":@{
                MJThemeIdentifierNormal:@"#666666",MJThemeIdentifierDark:@"#8E8E92"
        },
        @"black03":@{
                MJThemeIdentifierNormal:@"#999999",MJThemeIdentifierDark:@"#616161"
        },
    };
}

@end
