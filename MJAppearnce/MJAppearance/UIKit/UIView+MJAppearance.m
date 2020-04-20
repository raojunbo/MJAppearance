//
//  UIView+ThemeWeakHashTable.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIView+MJAppearance.h"
#import <objc/runtime.h>
#import "NSObject+MJAppearance.h"
#import "MJAppearanceColor.h"
#import "MJAppearanceImage.h"
#import "MJTheme.h"
#import "UIColor+MJAppearance.h"
#import "UIImage+MJAppearance.h"

@interface UIView ()

@end

@implementation UIView (MJAppearance)

+ (void)load {
    Method orgMet = class_getInstanceMethod([self class], @selector(didMoveToSuperview));
    Method newMet = class_getInstanceMethod([self class], @selector(mj_didMoveToSuperview));
    if (!orgMet || !newMet) {
        return ;
    }
    method_exchangeImplementations(orgMet, newMet);
}

- (void)setMj_backgroundColor:(UIColor *)mj_backgroundColor {
    if (mj_backgroundColor == nil) {
        return;
    }
    self.backgroundColor = mj_backgroundColor;
    [self.appearanceWorks setValue:mj_backgroundColor forKey:@"mj_backgroundColor"];
    [self needUpdateConfige];
}

- (UIColor *)mj_backgroundColor {
    return [self.appearanceWorks objectForKey:@"mj_backgroundColor"];
}

- (void)mj_didMoveToSuperview {
    [self mj_didMoveToSuperview];
    //将显示到屏幕上的view添加到weak表中，便于真正需要刷新的视图更新
    [[self class].objectWeakHashTable addObject:self];
}

- (void)mj_updateAppearanceColor {
    [self.appearanceWorks enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[UIColor class]]){
            //key 为属性名，object为属性值,且是UIColor(采用kvc方式统一处理)
            UIColor *originColor = [self valueForKey:key];
            if (originColor.colorName) {
                UIColor *newColor = [MJAppearanceColor mj_appearanceColorWithName:originColor.colorName];
                [self setValue:newColor forKey:key];
            }
        }
       
//        else if([obj isKindOfClass:[NSString class]] && [obj isEqualToString:@"UIImage"]){
//            //key 为属性名,object为属性值,且是UIImage
//            //key 为
//            UIImage *originImage = [self valueForKey:key];
//            if (originImage.imageName) {
//                UIImage *newImage = [MJAppearanceImage mj_imageWithName:originImage.imageName];
//                [self setValue:newImage forKey:key];
//            }
//        }
        
    }];
}

@end
