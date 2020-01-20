//
//  BEEHomeStyleCell.h
//  Dishes
//
//  Created by Roddick on 2019/11/25.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEEMineDishesShopsModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum {
  BEEHomeStyleCellStyleDishes  = 1 << 0,
  BEEHomeStyleCellStyleShops   = 1 << 1
}BEEHomeStyleCellStyle;

@interface BEEHomeStyleCell : UITableViewCell
@property (nonatomic ,strong) BEEMineDishesShopsModel * model;
@end

@interface BEEMineDishesShopsCell : UITableViewCell
@property (nonatomic ,strong) BEEMineDishesShopsModel * model;
@end

NS_ASSUME_NONNULL_END
