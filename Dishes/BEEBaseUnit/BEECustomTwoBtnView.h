//
//  BEECustomTwoBtnView.h
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BEECustomTwoBtnView : UIView
+(instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subtitle btnName:(NSString *)btnName otherBtnName:(NSString *)otherBtnName btnComplete:(void(^)(void))btnCompleteHandle otherBtnComplete:(void(^)(void))otherBtnCompleteHandle;
@end

NS_ASSUME_NONNULL_END
