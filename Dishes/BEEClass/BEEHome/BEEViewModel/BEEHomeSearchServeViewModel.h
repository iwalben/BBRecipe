//
//  BEEHomeSearchServeViewModel.h
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BEEHomeSearchServeViewModel : BEEBaseViewModel
@property (nonatomic ,copy) void(^selectedHandle)(NSString *title);
@end

NS_ASSUME_NONNULL_END
