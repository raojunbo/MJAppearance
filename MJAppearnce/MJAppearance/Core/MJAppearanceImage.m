//
//  MJAppearanceImage.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAppearanceImage.h"
#import "UIImage+MJAppearance.h"
#import "MJTheme.h"

@implementation MJAppearanceImage

+ (UIImage *)mj_imageWithName:(NSString *)imageName {
    UIImage *image = [self appearanceImageWithName:imageName];
    image.imageName = imageName;
    return image;
}

+ (UIImage *)mj_imageWithContentsOfFile:(NSString *)imageName {
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:imageName];
    image.imageName = imageName;
    return image;
}

+ (UIImage *)appearanceImageWithName:(NSString *)originImageName {
    if (!originImageName) {
        return nil;
    }
    NSString *realImageName = [NSString stringWithFormat:@"%@%@",originImageName,  [MJTheme sharedInstance].currentTheme.themePicPrefix];
    UIImage *newImage = [UIImage imageNamed:realImageName];
    newImage.imageName = originImageName;
    return newImage;
}

@end
