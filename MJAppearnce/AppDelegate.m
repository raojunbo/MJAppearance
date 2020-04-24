//
//  AppDelegate.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MJAppearance.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UIColor *tintColor = [UIColor colorWithRed:29.0/255.0
                                         green:173.0/255.0
                                          blue:234.0/255.0
                                         alpha:1.0];
    [self.window setTintColor:tintColor];
    ViewController *rootVC = [[ViewController alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:rootVC];
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
