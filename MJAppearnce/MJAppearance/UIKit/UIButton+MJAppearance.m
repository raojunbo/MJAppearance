//
//  UIButton+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIButton+MJAppearance.h"
#import <objc/runtime.h>
#import "NSObject+MJAppearance.h"
#import "UIColor+MJAppearance.h"
#import "UIImage+MJAppearance.h"
#import "MJTheme.h"
#import "MJAppearanceColor.h"
#import "MJAppearanceImage.h"

@implementation UIButton (MJAppearance)

- (void)setMj_tintColor:(UIColor *)mj_tintColor {
    if (mj_tintColor == nil) {
        return;
    }
    self.tintColor = mj_tintColor;
    [self.appearanceWorks setValue:mj_tintColor forKey:@"mj_tintColor"];
    [self needUpdateConfige];
}

- (UIColor *)mj_tintColor {
    return [self.appearanceWorks objectForKey:@"mj_tintColor"];
}

- (void)mj_setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [self setTitleColor:color forState:state];
    //key 为方法签名,value 为参数列表
    NSMutableDictionary *dictionary = [self.appearanceWorks valueForKey:NSStringFromSelector(_cmd)];
    if (!dictionary) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:color forKey:@"color"];
    [dictionary setValue:@(state) forKey:@"state"];
    [self.appearanceWorks setValue:dictionary forKey:NSStringFromSelector(_cmd)];
    [self needUpdateConfige];
}

- (void)mj_setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
    [self setBackgroundImage:image forState:state];
    //key 为方法签名,value 为参数列表
    NSMutableDictionary *dictionary = [self.appearanceUpdates valueForKey:NSStringFromSelector(_cmd)];
    if (!dictionary) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:image forKey:@"image"];
    [dictionary setValue:@(state) forKey:@"state"];
    [self.appearanceWorks setValue:dictionary forKey:NSStringFromSelector(_cmd)];
    [self needUpdateConfige];
}

- (void)mj_setImage:(UIImage *)image forState:(UIControlState)state {
    [self setImage:image forState:state];
    //key 为方法签名,value 为参数列表
    NSMutableDictionary *dictionary = [self.appearanceUpdates valueForKey:NSStringFromSelector(_cmd)];
    if (!dictionary) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:image forKey:@"image"];
    [dictionary setValue:@(state) forKey:@"state"];
    [self.appearanceWorks setValue:dictionary forKey:NSStringFromSelector(_cmd)];
    [self needUpdateConfige];
}

- (void)mj_updateAppearanceColor {
    [self.appearanceWorks enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            //key 为签名，object为parms统一处理
            if ([key isEqualToString:NSStringFromSelector(@selector(mj_setTitleColor:forState:))]) {
                NSDictionary <NSString *,id> *params = (NSDictionary *)obj;
                UIColor *originColor = params[@"color"];
                UIControlState state = [params[@"state"] intValue];
                UIColor *newColor = [MJAppearanceColor mj_appearanceColorWithName:originColor.colorName];
                [self mj_setTitleColor:newColor forState:state];
            }else if([key isEqualToString:NSStringFromSelector(@selector(mj_setBackgroundImage:forState:))]){
                NSDictionary <NSString *,id> *params = (NSDictionary *)obj;
                UIImage *originImage = params[@"image"];
                UIControlState state = [params[@"state"] intValue];
                UIImage *newImage = [MJAppearanceImage mj_imageWithName:originImage.imageName];
                [self mj_setBackgroundImage:newImage forState:state];
            }else if([key isEqualToString:NSStringFromSelector(@selector(mj_setImage:forState:))]){
                NSDictionary <NSString *,id> *params = (NSDictionary *)obj;
                UIImage *originImage = params[@"image"];
                UIControlState state = [params[@"state"] intValue];
                UIImage *newImage = [MJAppearanceImage mj_imageWithName:originImage.imageName];
                [self mj_setImage:newImage forState:state];
            }
        }else if([obj isKindOfClass:[UIColor class]]){
            //key 为属性名，object为属性值(采用kvc方式统一处理)
            UIColor *originColor = [self valueForKey:key];
            UIColor *newColor = [MJAppearanceColor mj_appearanceColorWithName:originColor.colorName];
            newColor.colorName = originColor.colorName;
            [self setValue:newColor forKey:key];
        }
    }];
}


@end
