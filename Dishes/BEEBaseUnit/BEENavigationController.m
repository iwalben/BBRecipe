//
//  BEENavigationController.m
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEENavigationController.h"

@interface BEENavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BEENavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if ( self = [super initWithRootViewController:rootViewController]) {
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.delegate = self;
            self.interactivePopGestureRecognizer.enabled = YES;
        }
    }
    return self;
}

+ (void)initialize{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    UIImage *image = [UIImage jk_imageWithColor:BEEaColor];
    [navigationBarAppearance setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setShadowImage:[UIImage new]];
    
    [navigationBarAppearance setTintColor:GnColor];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                                     NSForegroundColorAttributeName:UIColor.darkGrayColor,
                                     };
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBar].layer.shadowColor = [UIColor lightGrayColor].CGColor; //shadowColor阴影颜色
    [self navigationBar].layer.shadowOffset = CGSizeMake(1.5f , 1.5f); //shadowOffset阴影偏移x，y向(上/下)偏移(-/+)2
    [self navigationBar].layer.shadowOpacity = 0.2f;//阴影透明度，默认0
    [self navigationBar].layer.shadowRadius = 2.0f;//阴影半径
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.viewControllers.count != 1 && [gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return self.viewControllers.count != 1 && [gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

#pragma mark - UIViewControllerRotation
- (BOOL)shouldAutorotate{
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count>0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [button sizeToFit];
        button.jk_size = CGSizeMake(30, button.jk_height);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed = YES;
        if([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.enabled = YES;
            self.interactivePopGestureRecognizer.delegate = self;
        }
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark BackBtn M

- (void)goBack{
    [self popViewControllerAnimated:YES];
}

@end
