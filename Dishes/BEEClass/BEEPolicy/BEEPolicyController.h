//
//  BEEPolicyController.h
//  Dishes
//
//  Created by Roddick on 2019/12/9.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BEEPolicyController : BEEBaseViewController
@property (nonatomic ,copy) NSString * url ;
@property (nonatomic,copy) void (^agreementBlock)(void);
@property (nonatomic,copy) void (^noagreementBlock)(void);
@end

NS_ASSUME_NONNULL_END
