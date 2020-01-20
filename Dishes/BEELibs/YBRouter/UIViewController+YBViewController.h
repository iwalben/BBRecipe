//
//  UIViewController+YBViewController.h
//  AFNetworking
//
//  Created by apple on 2018/7/17.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YBViewController)

@property (nonatomic ,strong) NSDictionary *routeArguments;

/**
 获取app当前最栈顶的控制器
 @return viewController
 */
+ (UIViewController *)topViewController;

@end
