//
//  BEEBaseTabBarController.m
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseTabBarController.h"
#import "UIViewController+YBViewController.h"
#import "BEEIssueController.h"
#import "MJLoginViewController.h"

@interface BEEBaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BEEBaseTabBarController
+ (void)initialize{
    UITabBar *tabbarsub = [UITabBar appearance];
    [tabbarsub setBackgroundImage:[UIImage jk_imageWithColor:UIColor.whiteColor]];
    [tabbarsub setShadowImage:[UIImage new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tabBar].layer.shadowColor = [UIColor lightGrayColor].CGColor; //shadowColor阴影颜色
    [self tabBar].layer.shadowOffset = CGSizeMake(-2.0f , -2.0f); //shadowOffset阴影偏移x，y向(上/下)偏移(-/+)2
    [self tabBar].layer.shadowOpacity = 0.2f;//阴影透明度，默认0
    [self tabBar].layer.shadowRadius = 2.0f;//阴影半径
    
    if (@available(iOS 13.0, *)) {
        self.tabBar.tintColor = [UIColor jk_colorWithHex:0xC7C7C7];
        [[UITabBar appearance] setUnselectedItemTintColor:[UIColor jk_colorWithHex:0xC7C7C7]];
    }
    self.delegate = self;
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    childController.title = title;
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor jk_colorWithHex:0xD6B88D]} forState:UIControlStateSelected];
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor jk_colorWithHex:0xC7C7C7]} forState:UIControlStateNormal];
    childController.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BEENavigationController *nav = [[BEENavigationController alloc] initWithRootViewController:childController];
    nav.navigationBarHidden = YES;
    [self addChildViewController:nav];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    BEENavigationController *_nav=(BEENavigationController *)viewController;
    UIViewController *_vc =[_nav.viewControllers firstObject];
    if ([_vc.title isEqualToString:@"发布"]) {
        if (![[NSUserDefaults standardUserDefaults] boolForKey:BEELoginStatue]) {
            [YBRoutes registerLoginCompant:nil compleHandler:^(id object) {
                [self showIssueAlert];
            }];
            [YBRoutes openURL:@"BEERouter://login/present"];
            return NO ;
        }
        [self showIssueAlert];
        return NO ;
    }
    
    if ([_vc.title isEqualToString:@"我的"]) {
        if (![[NSUserDefaults standardUserDefaults] boolForKey:BEELoginStatue]) {
            [YBRoutes registerLoginCompant:nil compleHandler:^(id object) {
                tabBarController.selectedIndex = 4 ;
            }];
            [YBRoutes openURL:@"BEERouter://login/present"];
            return NO ;
        }
    }
    return YES;
}

-(void)showIssueAlert{
    [BEECustomTwoBtnView initWithTitle:@"温馨提示" subTitle:@"请选择要发布的内容" btnName:@"发布好馆" otherBtnName:@"发布菜谱" btnComplete:^{
        [YBRoutes openURL:@"BEERouter://push/BEEIssueController"];
    } otherBtnComplete:^{
        [YBRoutes openURL:@"BEERouter://push/BEEIssueDishesController"];
    }];
}


@end
