//
//  BEEHomeHorizontalCell.h
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEEMineDishesShopsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BEEHomeHorizontalCell : UITableViewCell
@property (nonatomic ,copy) NSArray * newestDatas;
@end

@interface BEEHomeHorizontalCellShopsDetailCell : UITableViewCell
@property (nonatomic ,copy) NSArray * newestDatas;
@end


@interface BEEHomeHorizontalItemCell : UICollectionViewCell
@property (nonatomic ,strong) BEEMineDishesShopsModel * model;
@end

NS_ASSUME_NONNULL_END
