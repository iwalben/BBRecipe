//
//  BEEHomeView.h
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BEEHomeView : BEEBaseView
@property (nonatomic ,copy) void(^currentIndexBlock)(NSInteger);
@end

typedef enum {
  BEEHomeStyleCellStyleNone    = 1 << 0,
  BEEHomeStyleCellStyleArrow   = 1 << 1
}BEEHomeTopBarStyle;

@interface BEEHomeTopBar : BEEBaseView

@property (nonatomic ,strong)UITextField *textField;

@property (nonatomic ,strong) UIView *backgroundView;

@property (nonatomic ,strong) UIButton *cancelButton;

@property (nonatomic ,strong) UIButton *backButton;

@property (nonatomic ,strong) UILabel * tLabel;

-(instancetype)initWithFrame:(CGRect)frame barStyle:(BEEHomeTopBarStyle)style;

@end

NS_ASSUME_NONNULL_END
