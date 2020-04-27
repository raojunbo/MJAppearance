//
//  UIImage+ImageName.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIImage+MJAppearance.h"
#import <objc/runtime.h>

@implementation UIImage (MJAppearance)

- (void)setImageName:(NSString *)imageName {
    if (imageName == nil) {
        return;
    }
    objc_setAssociatedObject(self, @selector(imageName), imageName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)imageName {
    return  objc_getAssociatedObject(self, @selector(imageName));
}

@end
