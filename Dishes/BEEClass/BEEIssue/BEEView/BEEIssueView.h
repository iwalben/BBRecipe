//
//  BEEIssueView.h
//  Dishes
//
//  Created by Roddick on 2019/11/26.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BEEIssueView : BEEBaseView

@end

@interface BEEIssueItemCell : BEEBaseView
@property (nonatomic ,strong) UILabel * tLabel ;
@property (nonatomic ,strong) UITextField * textfield;
@end

NS_ASSUME_NONNULL_END
