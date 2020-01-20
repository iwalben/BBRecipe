//
//  LHLCBaseKeyboardAvoidingScrollView.m
//  LHLC
//
//  Created by WalkerCloud on 2019/3/25.
//  Copyright © 2019年 Sameway. All rights reserved.
//

#import "LHLCBaseKeyboardAvoidingScrollView.h"


@interface LHLCBaseKeyboardAvoidingScrollView ()
@property (nonatomic ,assign)BOOL isLayout;
@end
@implementation LHLCBaseKeyboardAvoidingScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.isLayout = NO ;
        [self addSubview:self.contentView];
        self.contentView.frame = self.bounds ;
//        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self);
//            //因为上面的宽高是相对于contentSize的  所以为0  这里需要设置contentView的宽度约束后  scrollView的contentSize.width就会拉伸
//            make.width.equalTo(self);
//        }];
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        if (@available(iOS 13.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return self ;
}

-(UIView *)contentView
{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = GaColor ;
    }
    return _contentView ;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.isLayout) {
        self.contentView.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height) ;
    }
    self.isLayout = YES ;
}


@end
