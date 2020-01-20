//
//  LHLCAlertCustomView.h
//  LHLC
//
//  Created by WalkerCloud on 2019/4/26.
//  Copyright © 2019年 Sameway. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHLCAlertCustomView : UIView
+(instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subtitle imageName:(NSString *)imageName complete:(void(^)(void))completeHandle;
@end

NS_ASSUME_NONNULL_END
