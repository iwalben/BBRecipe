//
//  BEEBaseViewController.h
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BEEBaseViewController : UIViewController
@property (nonatomic , strong) NSDictionary * detailDic;
@property (nonatomic , copy) void (^handlerBlock)(id params);
@end

NS_ASSUME_NONNULL_END
