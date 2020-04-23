//
//  MJAppearanceImage.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "MJAppearanceImage.h"
#import "UIImage+MJAppearance.h"
#import "MJAppearanceManager.h"

@implementation MJAppearanceImage

+ (UIImage *)mj_imageWithName:(NSString *)imageName {
    return [self appearanceImageWithName:imageName];;
}

+ (UIImage *)mj_imageWithContentsOfFile:(NSString *)imageName {
    return [self appearanceImageWithContentsOfFile:imageName];
}

+ (UIImage *)appearanceImageWithName:(NSString *)originImageName {
    if (!originImageName) {
        return nil;
    }
    NSString *realImageName = [NSString stringWithFormat:@"%@%@",originImageName,  [MJAppearanceManager sharedInstance].currentThemePicSuffix];
    
    UIImage *newImage = [UIImage imageNamed:realImageName];
    newImage.imageName = originImageName;
    return newImage;
}

+ (UIImage *)appearanceImageWithContentsOfFile:(NSString *)originImageName {
    if (!originImageName) {
        return nil;
    }
    NSString *realImageName = [NSString stringWithFormat:@"%@%@",originImageName,  [MJAppearanceManager sharedInstance].currentThemePicSuffix];
    UIImage *newImage = [[UIImage  alloc]initWithContentsOfFile:realImageName];
    newImage.imageName = originImageName;
    return newImage;
}

@end
