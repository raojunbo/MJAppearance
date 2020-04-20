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

@interface UIImageView()

@end

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
    MJBlockPicker colorPicker = ^(){
        self.tintColor = [MJAppearanceColor mj_appearanceColorWithName:mj_tintColor.colorName];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)mj_tintColor {
    return self.tintColor;
}

- (void)setMj_image:(UIImage *)mj_image {
    if (mj_image == nil) {
        return;
    }
    self.image = mj_image;
    MJBlockPicker colorPicker = ^(){
        self.image = [MJAppearanceImage mj_imageWithName:mj_image.imageName];;
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (UIImage *)mj_image {
    return self.image;
}

- (void)setMj_supportDark:(BOOL)mj_supportDark {
    objc_setAssociatedObject(self,@selector(setMj_supportDark:), @(mj_supportDark), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)mj_supportDark {
    return objc_getAssociatedObject(self, @selector(setMj_supportDark:));
}

@end
