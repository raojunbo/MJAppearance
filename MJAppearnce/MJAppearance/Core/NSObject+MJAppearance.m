//
//  NSObject+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "NSObject+MJAppearance.h"
#import <objc/runtime.h>
#import "MJAppearanceManager.h"

static NSHashTable *objectWeakHashTable = NULL;

@implementation NSObject (MJAppearance)
@dynamic appearanceWorks;
@dynamic appearanceImageWorks;
@dynamic objectWeakHashTable;

+ (void)load {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateAppearance:) name:KAppMJAppearanceChangeNotifcation object:nil];
}

- (NSMutableDictionary<NSString *, id> *)appearanceUpdates {
    NSMutableDictionary<NSString *, id> *appearanceUpdates = objc_getAssociatedObject(self, @selector(appearanceUpdates));
    if (!appearanceUpdates) {
        appearanceUpdates = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(appearanceUpdates), appearanceUpdates, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return appearanceUpdates;
}

- (NSMutableDictionary<NSString *, id> *)appearanceWorks {
    NSMutableDictionary<NSString *, id> *appearanceWorks = objc_getAssociatedObject(self, @selector(appearanceWorks));
    if (!appearanceWorks) {
        appearanceWorks = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(appearanceWorks), appearanceWorks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return appearanceWorks;
}

- (NSMutableDictionary<NSString *, id> *)appearanceImageWorks {
    NSMutableDictionary<NSString *, id> *appearanceImageWorks = objc_getAssociatedObject(self, @selector(appearanceImageWorks));
    if (!appearanceImageWorks) {
        appearanceImageWorks = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(appearanceImageWorks), appearanceImageWorks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return appearanceImageWorks;
}

+ (NSHashTable *)objectWeakHashTable {
    if (objectWeakHashTable == NULL) {
        objectWeakHashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    }
    return objectWeakHashTable;
}

- (void)mj_addObjectToWeakHashTable:(id)object {
    [[self class].objectWeakHashTable addObject:object];
}

- (void)mj_updateAppearanceColor {
    [self.appearanceWorks enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, MJBlockPicker obj, BOOL * _Nonnull stop) {
        obj();
    }];
}

- (void)mj_updateAppearanceImage {
    [self.appearanceImageWorks enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, MJBlockPicker obj, BOOL * _Nonnull stop) {
           obj();
       }];
}

+ (void)updateAppearance:(NSNotification *)notification {
    BOOL sucess = true;
    if(sucess){
        NSArray *viewsArray = [self class].objectWeakHashTable.allObjects;
        [viewsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:[UIView class]]){
                UIView *view = obj;
                //iOS 13 系统
                if (@available(iOS 13.0, *)) {
                   //nothing to do
                } else {
                    BOOL needUpdateColors = [view respondsToSelector:@selector(mj_updateAppearanceColor)] && (view.appearanceWorks.allKeys.count > 0);
                    if (needUpdateColors) {
                        [view mj_updateAppearanceColor];
                    }
                }
                
                BOOL needUpdateImages = [view respondsToSelector:@selector(mj_updateAppearanceImage)] && (view.appearanceImageWorks.allKeys.count > 0);
                if (needUpdateImages) {
                    [view mj_updateAppearanceImage];
                }
            }
        }];
    }
}

@end
