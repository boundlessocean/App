//
//  AppDelegate.m
//  App
//
//  Created by boundlessocean on 2018/12/8.
//  Copyright © 2018年 boundless. All rights reserved.
//

#import "AppDelegate.h"
#import "BLFriendShipViewController.h"
@import BLBase.BLNavigationController;
@import YYKit.UIColor_YYAdd;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self _configRootVC];
    return YES;
}

- (void)_configRootVC{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = self.initianizeNav;
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
}

- (BLNavigationController *)initianizeNav{
    BLNavigationController *nav = BLNavigationController.new;
    nav.bgColor = [UIColor colorWithHexString:@"5A7EFF"];
    nav.titleColor = UIColor.whiteColor;
    nav.titleFont = [UIFont systemFontOfSize:17];
    [nav addChildViewController:BLFriendShipViewController.new];
    return nav;
}

@end

