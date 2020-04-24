//
//  MJAppearanceColor.m
//  testDark
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAppearanceColor.h"
#import "MJAppearanceManager.h"

#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static NSString * const MJColorLightKey = @"LIGHT";
static NSString * const MJColorDarkKey = @"DARK";

@interface MJAppearanceColor()
@property (nonatomic, strong) NSDictionary *colorsTableConfigure;
@property (nonatomic, strong) NSCache *lightColorCache;
@property (nonatomic, strong) NSCache *darkColorCache;
@end

@implementation MJAppearanceColor

+ (instancetype)sharedInstance {
    static MJAppearanceColor *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

- (instancetype)init {
    if(self = [super init]){
        [self loadColorConfigures];
        [self loadDefaultColors];
    }
    return self;
}

//- (UIColor *)colorWithLight:(NSUInteger)lightColor darkNumber:(NSUInteger)darkColor colorName:(NSString *)colorName {
// 如果是 iOS 13 及以后系统，使用系统的动态颜色。目的：以后最低版本到13之后，就可以把自定义方式删掉了
//    if (@available(iOS 13.0, *)) {
//        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
//            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ) {
//                [MJAppearanceManager sharedInstance].currentInterfaceStyle = MJUserInterfaceStyleDark;
//            }else{
//                [MJAppearanceManager sharedInstance].currentInterfaceStyle = MJUserInterfaceStyleLight;
//            }
//
//            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//                return  [self color:darkColor WithName:colorName];
//            }
//            return [self color:lightColor WithName:colorName];;
//        }];
//    }

// iOS13 以下使用自定义枚举判断，最低版本升级到13之后可以直接删
//    if ([MJAppearanceManager sharedInstance].currentInterfaceStyle == MJUserInterfaceStyleDark) {
//        return [self color:darkColor WithName:colorName];
//    }else{
//        return [self color:lightColor WithName:colorName];
//    }
//}

- (void)loadColorConfigures {
    self.colorsTableConfigure =  @{
        @"Mojiblue":@{MJColorLightKey:@(0x4294EA),@"DARK":@(0x0576E6)},
        @"page":@{MJColorLightKey:@(0xEEF1F4),@"DARK":@(0x1A1A1A)},
        @"white":@{MJColorLightKey:@(0xFFFFFF),@"DARK":@(0x2B2B2D)},
        @"black01":@{MJColorLightKey:@(0x212223),@"DARK":@(0xDDDDDF)},
        @"black02":@{MJColorLightKey:@(0x666666),@"DARK":@(0x8E8E92)},
        @"black03":@{MJColorLightKey:@(0x999999),@"DARK":@(0x616161)},
        @"lightgrey":@{MJColorLightKey:@(0xF9F9F9),@"DARK":@(0x353535)},
        @"black":@{MJColorLightKey:@(0x000000),@"DARK":@(0xDDDDDF)},
        @"black05":@{MJColorLightKey:@(0xC8C8C8),@"DARK":@(0x555555)},
        @"black04":@{MJColorLightKey:@(0xADADAD),@"DARK":@(0x616161)},
        @"red02":@{MJColorLightKey:@(0xf24949),@"DARK":@(0xDB3533)},
        @"yellow02":@{MJColorLightKey:@(0xFACE15),@"DARK":@(0xFEC500)},
    };
}

- (void)loadDefaultColors {
    self.Mojiblue = [self appearanceColorWithColorName:@"Mojiblue"];
    self.page = [self appearanceColorWithColorName:@"page"];
    self.white = [self appearanceColorWithColorName:@"white"];
    self.black01 = [self appearanceColorWithColorName:@"black01"];
    self.black02 = [self appearanceColorWithColorName:@"black02"];
    self.black03 = [self appearanceColorWithColorName:@"black03"];
    self.lightgrey = [self appearanceColorWithColorName:@"lightgrey"];
    self.black = [self appearanceColorWithColorName:@"black"];
    self.black04 = [self appearanceColorWithColorName:@"black04"];
    self.black05 = [self appearanceColorWithColorName:@"black05"];
    self.red02 = [self appearanceColorWithColorName:@"red02"];
    self.yellow02 = [self appearanceColorWithColorName:@"yellow02"];
}

- (UIColor *)mj_appearanceColorWithName:(NSString *)appearanceColorName {
    return [self appearanceColorWithColorName:appearanceColorName];
}

- (UIColor *)appearanceColorWithColorName:(NSString *)colorName {
    NSDictionary *colorsPairs = [self.colorsTableConfigure objectForKey:colorName];
    
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
             
            //怎么知道统一的 修改 模式
//            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ) {
//                [MJAppearanceManager sharedInstance].currentInterfaceStyle = MJUserInterfaceStyleDark;
//            }else{
//                [MJAppearanceManager sharedInstance].currentInterfaceStyle = MJUserInterfaceStyleLight;
//            }
            
            //先是设置
            int rgbValue = [[colorsPairs objectForKey:MJColorLightKey] intValue];
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                rgbValue = [[colorsPairs objectForKey:MJColorDarkKey] intValue];
            }else {
                rgbValue =  [[colorsPairs objectForKey:MJColorLightKey] intValue];
            }
            
            return [self color:rgbValue WithName:colorName];
        }];
    }
    
    int rgbValue = [[colorsPairs objectForKey:MJColorLightKey] intValue];
    if ([MJAppearanceManager sharedInstance].currentInterfaceStyle == MJUserInterfaceStyleDark) {
        rgbValue = [[colorsPairs objectForKey:MJColorDarkKey] intValue];
    }else {
        rgbValue =  [[colorsPairs objectForKey:MJColorLightKey] intValue];
    }
    return [self color:rgbValue WithName:colorName];
}

- (UIColor *)color:(NSUInteger)rgbValue WithName:(NSString *)colorName {
    UIColor *color = UIColorFromHEX(rgbValue);
    color.colorName = colorName;
    return color;
}

@end


