//
//  UIImageView+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIImageView+MJAppearance.h"
#import <objc/runtime.h>
#import "NSObject+MJAppearance.h"
#import "UIImage+MJAppearance.h"
#import "UIColor+MJAppearance.h"
#import "MJAppearanceColor.h"
#import "MJAppearanceImage.h"

@implementation UIImageView (MJAppearance)

- (instancetype)mj_initWithImage:(UIImage *)image {
    UIImageView *imageView = [self initWithImage:image];
    [imageView setMj_image:image];
    return imageView;
}

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

- (void)setMj_image:(UIImage *)mj_image {
    if (mj_image == nil) {
        return;
    }
    self.image = mj_image;
    NSMutableDictionary *dictionary = [self.appearanceUpdates valueForKey:NSStringFromSelector(_cmd)];
    if (!dictionary) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    //存imageName而不存UIImage是为了节省内存
    [dictionary setValue:mj_image.imageName forKey:@"imageName"];
    [self.appearanceWorks setValue:dictionary forKey:NSStringFromSelector(_cmd)];
    [self needUpdateConfige];
}

- (UIImage *)mj_image {
    return  self.image;
}

- (void)mj_updateAppearanceColor {
    [self.appearanceWorks enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            //key 为签名，object为parms统一处理
            if ([key isEqualToString:NSStringFromSelector(@selector(setMj_image:))]) {
                NSDictionary <NSString *,id> *params = (NSDictionary *)obj;
                NSString *originImageName = params[@"imageName"];
                UIImage *newImage = [MJAppearanceImage mj_imageWithName:originImageName];
                [self setMj_image:newImage];
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
