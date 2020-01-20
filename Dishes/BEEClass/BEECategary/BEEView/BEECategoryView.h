//
//  BEECategoryView.h
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseView.h"
#import "BEEHomeDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BEECategoryView : BEEBaseView

@end

@interface BEECategoryItemCell : UICollectionViewCell
@property (nonatomic ,strong) BEEHomeDetailModel * model ;
@end


NS_ASSUME_NONNULL_END
