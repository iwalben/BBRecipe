//
//  BEEHomeShopsDetailServeViewModel.h
//  Dishes
//
//  Created by Roddick on 2019/11/26.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseViewModel.h"
#import "BEEHomeDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BEEHomeShopsDetailServeViewModel : BEEBaseViewModel<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) BEEHomeDetailModel * model;
@end

NS_ASSUME_NONNULL_END
