//
//  BEEHomeDiesDetailView.h
//  Dishes
//
//  Created by Roddick on 2019/11/26.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BEEHomeDiesDetailView : BEEBaseView

@end

@interface BEEHomeDiesDetailStyleCellA : UITableViewCell
@property (nonatomic ,strong) UILabel * tLabel ;
@end

@interface BEEHomeDiesDetailStyleCellB : UITableViewCell
@property (nonatomic ,strong) UILabel * tLabel ;
@property (nonatomic ,strong) UILabel * sLabel ;
@end

NS_ASSUME_NONNULL_END
