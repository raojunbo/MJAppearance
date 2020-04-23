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
#import "MJAppearanceManager.h"

@interface UIImageView()
@property (nonatomic, strong) CALayer *darkLayer;
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
        self.tintColor = [MJColor mj_appearanceColorWithName:mj_tintColor.colorName];;
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

- (void)setMj_netImageSupportDark:(BOOL)mj_netImageSupportDark {
    objc_setAssociatedObject(self,@selector(setMj_netImageSupportDark:), @(mj_netImageSupportDark), OBJC_ASSOCIATION_ASSIGN);
    MJBlockPicker colorPicker = ^(){
        if (mj_netImageSupportDark) {
            if([MJAppearanceManager sharedInstance].currentMode == MJAppearanceModeDark){
                [self.layer addSublayer:self.darkLayer];
            }else{
                [self.darkLayer removeFromSuperlayer];
            }
        }else{
            [self.darkLayer removeFromSuperlayer];
        }
    };
    [self.appearanceWorks setValue:[colorPicker copy] forKey:NSStringFromSelector(_cmd)];
}

- (BOOL)mj_netImageSupportDark {
      return objc_getAssociatedObject(self, @selector(setMj_netImageSupportDark:));
}

- (CALayer *)darkLayer {
    CALayer *tempDarkLayer =  objc_getAssociatedObject(self, @selector(setDarkLayer:));
    if (!tempDarkLayer) {
        tempDarkLayer = [CALayer layer];
        tempDarkLayer.bounds = self.bounds;
        tempDarkLayer.anchorPoint = CGPointMake(0, 0);
        tempDarkLayer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1].CGColor;// [UIColor redColor].CGColor;
        [self setDarkLayer:tempDarkLayer];
    }
    return tempDarkLayer;
}

- (void)setDarkLayer:(CALayer *)darkLayer {
    if (darkLayer!=nil) {
        objc_setAssociatedObject(self,@selector(setDarkLayer:),darkLayer, OBJC_ASSOCIATION_RETAIN);
    }
}

@end
