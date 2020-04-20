//
//  MJAppearanceImage.h
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJAppearanceImage : NSObject
//@property (nonatomic,strong)

+ (UIImage *)mj_imageWithName:(NSString *)imageName;

+ (UIImage *)mj_imageWithContentsOfFile:(NSString *)imageName;

//图片alopl
//uimgage 层；

@end

NS_ASSUME_NONNULL_END
