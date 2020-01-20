//
//  UIViewController+YBViewController.m
//  AFNetworking
//
//  Created by apple on 2018/7/17.
//

#import "UIViewController+YBViewController.h"
#import <objc/runtime.h>

@implementation UIViewController (YBViewController)

- (NSDictionary *)routeArguments{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRouteArguments:(NSDictionary *)routeArguments{
    objc_setAssociatedObject(self, @selector(routeArguments), routeArguments, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (UIViewController *)topViewController{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
//        UIView *frontView = [[window subviews] objectAtIndex:0];
//        nextResponder = [frontView nextResponder];
        nextResponder = window.rootViewController;
    }
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        result=nav.childViewControllers.lastObject;
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    return result;
}
@end
