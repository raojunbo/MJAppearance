//
//  UIColor+ColorName.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "UIColor+MJAppearance.h"
#import <objc/runtime.h>

@implementation UIColor (MJAppearance)
@dynamic colorName;

- (void)setColorName:(NSString *)colorName {
    if (colorName == nil) {
        return;
    }
   objc_setAssociatedObject(self, @selector(colorName), colorName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)colorName {
    NSString *colorName = objc_getAssociatedObject(self, @selector(colorName));
    return colorName;
}

@end
