//
//  BEEMIneContaceUsView.m
//  Dishes
//
//  Created by Roddick on 2019/11/28.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMIneContaceUsView.h"
#import "LHLCBaseKeyboardAvoidingScrollView.h"

@interface BEEMIneContaceUsView ()
@property (nonatomic ,strong) LHLCBaseKeyboardAvoidingScrollView * scrollView;
@property (nonatomic ,strong) FSTextView * textViewA ;
@property (nonatomic ,strong) FSTextView * textViewB ;
@property (nonatomic ,strong) BEELoadingButton * subBtn;
@end


@implementation BEEMIneContaceUsView

-(void)initAppearValue
{
    [self addSubview:self.scrollView];

    
    UILabel * recommendLabel = [UILabel new];
    recommendLabel.font = BEEBOLDSYSTEMFONT(13);
    recommendLabel.textColor = BEEeColor;
    recommendLabel.text = @"您的诉求：";
    
    [self.scrollView.contentView addSubview:recommendLabel];
    [self.scrollView.contentView addSubview:self.textViewA];
    
    UILabel * recommendDishesLabel = [UILabel new];
    recommendDishesLabel.font = BEEBOLDSYSTEMFONT(13);
    recommendDishesLabel.textColor = BEEeColor;
    recommendDishesLabel.text = @"您的联系方式：";
    
    [self.scrollView.contentView addSubview:recommendDishesLabel];
    [self.scrollView.contentView addSubview:self.textViewB];
    [self.scrollView.contentView addSubview:self.subBtn];
    
    
    [recommendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(17));
        make.top.mas_offset(BEEZoomW(20));
        make.height.mas_offset(BEEZoomW(20));
    }];
    
    [self.textViewA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(17));
        make.right.mas_offset(BEEZoomW(-17));
        make.top.mas_equalTo(recommendLabel.mas_bottom).offset(BEEZoomW(5));
        make.height.mas_offset(BEEZoomW(100));
    }];
    
    [recommendDishesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(17));
        make.top.mas_equalTo(self.textViewA.mas_bottom).offset(BEEZoomW(5));
        make.height.mas_offset(BEEZoomW(20));
    }];
    
    [self.textViewB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(17));
        make.right.mas_offset(BEEZoomW(-17));
        make.top.mas_equalTo(recommendDishesLabel.mas_bottom).offset(BEEZoomW(5));
        make.height.mas_offset(BEEZoomW(35));
    }];
    
    [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_offset((BEEW-BEEZoomW(343))/2);
           make.top.mas_equalTo(self.textViewB.mas_bottom).offset(BEEZoomW(200));
           make.width.mas_offset(BEEZoomW(343));
           make.height.mas_offset(BEEZoomW(32));
    }];
    
    self.scrollView.contentSize = CGSizeMake(BEEW, BEEH);
    
}

-(LHLCBaseKeyboardAvoidingScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[LHLCBaseKeyboardAvoidingScrollView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEH - BEENavigationBarHeight)];
        _scrollView.backgroundColor = GaColor;
        _scrollView.scrollEnabled = YES ;
    }
    return _scrollView ;
}

-(FSTextView *)textViewA
{
    if (!_textViewA) {
        _textViewA = [[FSTextView alloc]init];
        _textViewA.font = BEESYSTEMFONT(12);
        _textViewA.maxLength = 200;
        _textViewA.placeholder = @"请填写您的诉求，不能超过200字喔";
        BEEViewBorderRadius(_textViewA, BEEZoomW(3), 1, GtColor);
    }
    return _textViewA ;
}

-(FSTextView *)textViewB
{
    if (!_textViewB) {
        _textViewB = [[FSTextView alloc]init];
        _textViewB.font = BEESYSTEMFONT(12);
        _textViewB.maxLength = 200;
        _textViewB.placeholder = @"请填写联系方式";
        BEEViewBorderRadius(_textViewB, BEEZoomW(3), 1, GtColor);
    }
    return _textViewB ;
}

-(BEELoadingButton *)subBtn
{
    if (!_subBtn) {
        _subBtn = [BEELoadingButton new];
        [_subBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_subBtn.titleLabel setFont:BEESYSTEMFONT(16)];
        [_subBtn setTitleColor:GaColor forState:UIControlStateNormal];
        BEEViewRadius(_subBtn, BEEZoomW(16));
        [_subBtn setBackgroundImage:[UIImage jk_imageWithColor:BEEpColor] forState:UIControlStateNormal];
        [_subBtn addTarget:self action:@selector(subClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subBtn ;
}

-(void)subClick
{
    
    if (self.textViewA.text.length <= 0 || self.textViewB.text.length <= 0  ) {
        [YBProgressHUD showInfoMessage:@"请将信息填写完整!"];
        return ;
    }
    
    [self.subBtn startLoadingAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.subBtn stopLoadingAnimation];
        [LHLCVerifyAlertCustomView initWithTitle:@"温馨提示" subTitle:@"感谢您的反馈，我们会尽快处理，并给您及时的反馈。" complete:^{
            [YBRoutes openURL:@"BEERouter://pop/nil"];
        }];
    });
}

@end
