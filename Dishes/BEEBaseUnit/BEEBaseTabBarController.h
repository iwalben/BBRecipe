//
//  BEEBaseTabBarController.h
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BEEBaseTabBarController : UITabBarController
/**
 @brief 添加控制器
 @param childController 自控制器
 @param title 名称
 @param imageName 图片名
 @param selectedImageName 选中图片名
 */
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;
@end

NS_ASSUME_NONNULL_END
