//
//  NSObject+MJAppearance.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/18.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "NSObject+MJAppearance.h"
#import <objc/runtime.h>
#import "MJTheme.h"

static NSHashTable *objectWeakHashTable = NULL;

@implementation NSObject (MJAppearance)
@dynamic appearanceUpdates;
@dynamic appearanceWorks;
@dynamic objectWeakHashTable;

//+ (void)initialize {
//
//}

+ (void)load {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateAppearance:) name:KAppThemeChangeNotifcation object:nil];
}

- (NSMutableDictionary<NSString *, id> *)appearanceUpdates {
    NSMutableDictionary<NSString *, id> *appearanceUpdates = objc_getAssociatedObject(self, @selector(appearanceUpdates));
    if (!appearanceUpdates) {
        appearanceUpdates = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(appearanceUpdates), appearanceUpdates, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return appearanceUpdates;
}

-(NSMutableDictionary<NSString *, id> *)appearanceWorks {
    NSMutableDictionary<NSString *, id> *appearanceWorks = objc_getAssociatedObject(self, @selector(appearanceWorks));
    if (!appearanceWorks) {
        appearanceWorks = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(appearanceWorks), appearanceWorks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return appearanceWorks;
}

+ (NSHashTable *)objectWeakHashTable {
    if (objectWeakHashTable == NULL) {
        objectWeakHashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    }
    return objectWeakHashTable;
}

- (void)addObjectToWeakHashTable:(id)object {
    [[self class].objectWeakHashTable addObject:object];
}

- (void)needUpdateConfige {
    if(![self.appearanceUpdates objectForKey:@"needUpdate"]){
        MJAppearanceUpdate updateAppearanceBlock = ^(){
            [self mj_updateAppearanceColor];
        };
        [self.appearanceUpdates setValue:[updateAppearanceBlock copy] forKey:@"needUpdate"];
    };
}

- (void)mj_updateAppearanceColor {
    //空实现，子类自己实现
}

+ (void)updateAppearance:(NSNotification *)notification {
    NSString *object = notification.object;
    if ([object isKindOfClass:[NSString class]] && object.length > 0 ) {
        BOOL sucess = true;//[[MJTheme sharedInstance] switchToTheme:object];
        if(sucess){
            NSArray *viewsArray = [self class].objectWeakHashTable.allObjects;
            [viewsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if([obj isKindOfClass:[UIView class]]){
                    UIView *view = obj;
                    for (NSString *key in view.appearanceUpdates.allKeys) {
                        if ([key isEqualToString:@"needUpdate"]) {
                            MJAppearanceUpdate picker = view.appearanceUpdates[key];
                            picker();
                        }
                    }
                }
            }];
        }
    }
}

@end
