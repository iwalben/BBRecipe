//
//  AppDelegate.m
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "AppDelegate.h"
#import "MJLoginViewController.h"
#import "BEEPolicyController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [YBRouteRegister enroll:nil];
    [BEEDataManager loadDatas];
    self.window = [[UIWindow alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    BEEBaseTabBarController *tarBarViewController = [[BEEBaseTabBarController alloc]init];
    [tarBarViewController addChildViewController:[BEEHomeController new] title:@"首页" imageName:@"icon_shouye" selectedImageName:@"icon_shouye2"];
    [tarBarViewController addChildViewController:[BEECategoryController new] title:@"分类" imageName:@"icon_fenlei" selectedImageName:@"icon_fenlei2"];
    [tarBarViewController addChildViewController:[BEEIssueController new] title:@"发布" imageName:@"icon_fabu" selectedImageName:@"icon_fabu2"];
    [tarBarViewController addChildViewController:[BEEShopsController new] title:@"好馆" imageName:@"icon_haoguan" selectedImageName:@"icon_haoguan2"];
    [tarBarViewController addChildViewController:[BEEMineController new] title:@"我的" imageName:@"icon_wode" selectedImageName:@"icon_wode2"];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:BEEPolicyStatue]) {
        self.window.rootViewController = tarBarViewController;
    }else{
        BEEPolicyController * policyVC = [BEEPolicyController new];
        BEENavigationController *nav = [[BEENavigationController alloc] initWithRootViewController:policyVC];
        policyVC.url = @"http://cmdkj.com/private.html";
        policyVC.agreementBlock = ^{
            self.window.rootViewController = tarBarViewController;
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BEEPolicyStatue];
        };
        self.window.rootViewController = nav;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    if ([url.scheme isEqualToString:BEEHttpRouteSchema]
        || [url.scheme isEqualToString:BEEHttpsRouteSchema]
        || [url.scheme isEqualToString:BEEDefaultRouteSchema]) {
        //NSLog(@"[JLRoutes]: %@", url);
        return [YBRoutes.globalRoutes routeURL:url];
    }
    return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}



@end
