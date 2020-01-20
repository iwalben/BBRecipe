//
//  BEEIssueView.m
//  Dishes
//
//  Created by Roddick on 2019/11/26.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEIssueView.h"
#import "LHLCBaseKeyboardAvoidingScrollView.h"


@interface BEEIssueView ()
@property (nonatomic ,strong) LHLCBaseKeyboardAvoidingScrollView * scrollView;
@property (nonatomic ,strong) BEEIssueItemCell * cellA;
@property (nonatomic ,strong) BEEIssueItemCell * cellB;
@property (nonatomic ,strong) FSTextView * textViewA ;
@property (nonatomic ,strong) FSTextView * textViewB ;

@property (nonatomic ,strong) UIImageView * exampleImageV ;
@property (nonatomic ,strong) UIImageView * phoneImageV ;

@property (nonatomic ,strong) BEELoadingButton * subBtn;
@property (nonatomic ,strong) BEELoadingButton * draftBtn;

@property (nonatomic ,strong) LHLCPickPhotoManager * photoManager;
@end

@implementation BEEIssueView

-(void)initAppearValue
{
    [self addSubview:self.scrollView];
    //self.scrollView.frame = CGRectMake(0, 0, BEEW, BEEH - BEENavigationBarHeight);
    [self.scrollView.contentView addSubview:self.cellA];
    [self.scrollView.contentView addSubview:self.cellB];

    
    [self.cellA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(0);
        make.height.mas_offset(BEEZoomW(40));
    }];
    
    [self.cellB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(self.cellA.mas_bottom);
        make.height.mas_offset(BEEZoomW(40));
    }];
    
    UILabel * recommendLabel = [UILabel new];
    recommendLabel.font = BEEBOLDSYSTEMFONT(13);
    recommendLabel.textColor = BEEeColor;
    recommendLabel.text = @"推荐理由：";
    
    UILabel * recommendDishesLabel = [UILabel new];
    recommendDishesLabel.font = BEEBOLDSYSTEMFONT(13);
    recommendDishesLabel.textColor = BEEeColor;
    recommendDishesLabel.text = @"推荐必点菜：";
    
    UILabel * coverLabel = [UILabel new];
    coverLabel.font = BEEBOLDSYSTEMFONT(13);
    coverLabel.textColor = BEEeColor;
    coverLabel.text = @"封面图：";
    
    
    UILabel * coverTipsLabel = [UILabel new];
    coverTipsLabel.font = BEESYSTEMFONT(13);
    coverTipsLabel.textColor = BEEoColor;
    coverTipsLabel.text = @"(支持JPG，Gif，PNG，小于1MB)";
    
    [self.scrollView.contentView addSubview:recommendLabel];
    [self.scrollView.contentView addSubview:self.textViewA];
    [self.scrollView.contentView addSubview:recommendDishesLabel];
    [self.scrollView.contentView addSubview:self.textViewB];
    [self.scrollView.contentView addSubview:coverLabel];
    [self.scrollView.contentView addSubview:coverTipsLabel];
    
    [self.scrollView.contentView addSubview:self.exampleImageV];
    [self.scrollView.contentView addSubview:self.phoneImageV];
    [self.scrollView.contentView addSubview:self.subBtn];
    [self.scrollView.contentView addSubview:self.draftBtn];
    
    
    [recommendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(17));
        make.top.mas_equalTo(self.cellB.mas_bottom).offset(BEEZoomW(5));
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
        make.height.mas_offset(BEEZoomW(100));
    }];
    
    [coverLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(17));
        make.top.mas_equalTo(self.textViewB.mas_bottom).offset(BEEZoomW(5));
        make.height.mas_offset(BEEZoomW(20));
    }];
    
    [coverTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(17));
        make.top.mas_equalTo(coverLabel.mas_bottom).offset(BEEZoomW(5));
        make.height.mas_offset(BEEZoomW(20));
    }];
    
    
    CGFloat width = (BEEW - BEEZoomW(17)*3)/2 ;
    [self.exampleImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(17));
        make.top.mas_equalTo(coverTipsLabel.mas_bottom);
        make.width.mas_offset(width);
        make.height.mas_offset(BEEZoomW(95));
    }];
    
    [self.phoneImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.exampleImageV.mas_right).offset(BEEZoomW(17));
        make.top.mas_equalTo(coverTipsLabel.mas_bottom);
        make.width.mas_offset(width);
        make.height.mas_offset(BEEZoomW(95));
    }];
    
    [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_offset((BEEW-BEEZoomW(343))/2);
           make.top.mas_equalTo(self.phoneImageV.mas_bottom).offset(BEEZoomW(40));
           make.width.mas_offset(BEEZoomW(343));
           make.height.mas_offset(BEEZoomW(32));
    }];
    
    
    [self.draftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_offset((BEEW-BEEZoomW(343))/2);
           make.top.mas_equalTo(self.subBtn.mas_bottom).offset(BEEZoomW(16));
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


-(BEEIssueItemCell *)cellA
{
    if (!_cellA) {
        _cellA = [[BEEIssueItemCell alloc]init];
        _cellA.tLabel.text = @"馆子名称：";
        _cellA.textfield.placeholder = @"招牌名字，长度1-50";
    }
    return _cellA ;
}

-(BEEIssueItemCell *)cellB
{
    if (!_cellB) {
        _cellB = [[BEEIssueItemCell alloc]init];
        _cellB.tLabel.text = @"馆子地址：";
        _cellB.textfield.placeholder = @"选填，如万达广场";
    }
    return _cellB ;
}

-(FSTextView *)textViewA
{
    if (!_textViewA) {
        _textViewA = [[FSTextView alloc]init];
        _textViewA.font = BEESYSTEMFONT(12);
        _textViewA.maxLength = 200;
        _textViewA.placeholder = @"请填写推荐理由，不能超过200字喔";
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
        _textViewB.placeholder = @"请填写推荐必点菜理由，不能超过200字喔";
        BEEViewBorderRadius(_textViewB, BEEZoomW(3), 1, GtColor);
    }
    return _textViewB ;
}

-(UIImageView *)exampleImageV
{
    if (!_exampleImageV) {
        _exampleImageV = [UIImageView new];
        _exampleImageV.image = [UIImage imageNamed:@"pic_example"];
    }
    return _exampleImageV ;
}


-(UIImageView *)phoneImageV
{
    if (!_phoneImageV) {
        _phoneImageV = [UIImageView new];
        _phoneImageV.backgroundColor = BEEmColor ;
        BEEViewBorderRadius(_phoneImageV, BEEZoomW(3), 1, GtColor);
        
        UIImageView * iconImageView = [UIImageView new];
        iconImageView.image = [UIImage imageNamed:@"icon_上传图片"];
        [_phoneImageV addSubview:iconImageView];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_offset(0);
            make.centerY.mas_offset(BEEZoomW(-10));
            make.width.mas_offset(BEEZoomW(35));
            make.height.mas_offset(BEEZoomW(25));
        }];
        UILabel *postLabel = [UILabel new];
        [_phoneImageV addSubview:postLabel];
        postLabel.font = BEESYSTEMFONT(13);
        postLabel.textColor = BEEeColor;
        postLabel.textAlignment = NSTextAlignmentCenter ;
        postLabel.text = @"上传照片";
        [postLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(iconImageView.mas_bottom).offset(BEEZoomW(8));
            make.centerX.mas_offset(0);
        }];
        
        _phoneImageV.userInteractionEnabled = YES ;
        @weakify(self)
        [_phoneImageV jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            @strongify(self)
            self.photoManager = [LHLCPickPhotoManager pick:^(UIImage * _Nonnull image, UIImagePickerController * _Nonnull picker) {
                [iconImageView removeFromSuperview];
                [postLabel removeFromSuperview];
                self->_phoneImageV.image = image ;
            }];
        }];
    }
    return _phoneImageV ;
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

-(BEELoadingButton *)draftBtn
{
    if (!_draftBtn) {
        _draftBtn = [BEELoadingButton new];
        [_draftBtn setTitle:@"保存到草稿箱" forState:UIControlStateNormal];
        [_draftBtn.titleLabel setFont:BEESYSTEMFONT(16)];
        [_draftBtn setTitleColor:GaColor forState:UIControlStateNormal];
        BEEViewRadius(_draftBtn, BEEZoomW(16));
        [_draftBtn setBackgroundImage:[UIImage jk_imageWithColor:BEEqColor] forState:UIControlStateNormal];
        [_draftBtn addTarget:self action:@selector(draftClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _draftBtn ;
}

-(void)subClick
{
    if ([self verfifyInformation]) {
        [YBProgressHUD showInfoMessage:@"请将信息填写完整!"];
        return ;
    }
    
    [self.subBtn startLoadingAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.subBtn stopLoadingAnimation];
        [LHLCVerifyAlertCustomView initWithTitle:@"温馨提示" subTitle:@"感谢您上传的菜谱，我们会尽快审核；通过后就可以展示咋广大用户读者面前了" complete:^{
            [YBRoutes openURL:@"BEERouter://pop/nil"];
        }];
    });
    
}

-(void)draftClick
{
    if ([self verfifyInformation]) {
        [YBProgressHUD showInfoMessage:@"请将信息填写完整!"];
        return ;
    }
     
    [self.draftBtn startLoadingAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.draftBtn stopLoadingAnimation];
        [LHLCVerifyAlertCustomView initWithTitle:@"温馨提示" subTitle:@"感谢您上传的菜谱，已上传到草稿箱" complete:^{
            [YBRoutes openURL:@"BEERouter://pop/nil"];
        }];
    });
}

-(BOOL)verfifyInformation
{
    return self.cellA.textfield.text.length <= 0 || self.textViewA.text.length <= 0 || self.textViewB.text.length <= 0 ;
}

@end


#pragma mark - BEEIssueItemCell -

@interface BEEIssueItemCell ()

@end

@implementation BEEIssueItemCell

-(void)initAppearValue
{
    self.backgroundColor = UIColor.whiteColor ;
    UIView * line = [UIView new];
    line.backgroundColor = BEEnColor ;
    [self addSubview:self.tLabel];
    [self addSubview:self.textfield];
    [self addSubview:line];
    
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(17));
        make.centerY.mas_offset(0);
        make.height.mas_offset(BEEZoomW(20));
        make.width.mas_offset(BEEZoomW(80));
    }];
    
    [self.textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.tLabel.mas_right).offset(BEEZoomW(10));
        make.right.mas_offset(BEEZoomW(-10));
        make.centerY.mas_offset(0);
        make.height.mas_offset(BEEZoomW(25));
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.tLabel);
        make.right.mas_offset(-10);
        make.bottom.mas_offset(0);
        make.height.mas_offset(1);
    }];
}

-(UILabel *)tLabel
{
    if(!_tLabel){
        _tLabel = [UILabel new];
        _tLabel.font = BEEBOLDSYSTEMFONT(13);
        _tLabel.textColor = BEEeColor;
        _tLabel.text = @"-";
    }
    return _tLabel ;
}

-(UITextField *)textfield
{
    if (!_textfield) {
        _textfield = [UITextField new];
        _textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textfield.textAlignment = NSTextAlignmentLeft ;
        [_textfield setFont:BEESYSTEMFONT(14)];
        [_textfield setTextColor:GbColor];
    }
    return _textfield ;
}

@end
