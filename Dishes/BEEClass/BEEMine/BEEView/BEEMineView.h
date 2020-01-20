//
//  BEEMIneView.h
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BEEMineView : BEEBaseView

@end

@interface BEEMineCell : UITableViewCell
@property (nonatomic ,strong) UIImageView * iconImageView;
@property (nonatomic ,strong) UILabel * tLabel ;
@end

NS_ASSUME_NONNULL_END
