//
//  MJLoginViewController.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJLoginViewController : BEEBaseViewController<JLRRouteHandlerTarget>
+ (instancetype)loginViewController;
@property (nonatomic,copy) void (^loginBlock)(BOOL success, NSString *error);
@end
