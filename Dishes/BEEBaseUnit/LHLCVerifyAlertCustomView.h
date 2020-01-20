//
//  LHLCVerifyAlertCustomView.h
//  LHLC
//
//  Created by WalkerCloud on 2019/4/28.
//  Copyright © 2019 Sameway. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHLCVerifyAlertCustomView : UIView
+(instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subtitle complete:(void(^)(void))completeHandle;
@end

NS_ASSUME_NONNULL_END
