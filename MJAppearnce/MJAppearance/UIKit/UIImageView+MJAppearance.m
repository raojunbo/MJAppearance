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

@implementation UIImageView (MJAppearance)

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
    [self.appearanceWorks setValue:mj_image forKey:@"mj_image"];
    [self needUpdateConfige];
}

- (UIImage *)mj_image {
    return [self.appearanceWorks objectForKey:@"mj_image"];
}

@end
