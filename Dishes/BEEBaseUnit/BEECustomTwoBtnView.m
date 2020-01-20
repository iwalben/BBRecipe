//
//  BEECustomTwoBtnView.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEECustomTwoBtnView.h"

@interface BEECustomTwoBtnView ()
@property (nonatomic , strong)UIView * containView;
@property (nonatomic , strong)UILabel * titleL;
@property (nonatomic , strong)UILabel * subtitleL;
@property (nonatomic , strong)UIButton * closeBtn;
@property (nonatomic , strong)UIButton * knowBtn;
@property (nonatomic , strong)UIButton * otherBtn;

@property (nonatomic ,strong)NSString *title;
@property (nonatomic ,strong)NSString *subtitle;
@property (nonatomic ,strong)NSString *btnName;
@property (nonatomic ,strong)NSString *otherBtnName;

@property (nonatomic ,copy) void(^btnCompeleteHandle)(void);
@property (nonatomic ,copy) void(^otherBtnCompeleteHandle)(void);
@end

@implementation BEECustomTwoBtnView

+(instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subtitle btnName:(NSString *)btnName otherBtnName:(NSString *)otherBtnName btnComplete:(void(^)(void))btnCompleteHandle otherBtnComplete:(void(^)(void))otherBtnCompleteHandle
{
    BEECustomTwoBtnView * view = [[self alloc] initWithTitle:title subTitle:subtitle btnName:btnName otherBtnName:otherBtnName btnComplete:btnCompleteHandle otherBtnComplete:otherBtnCompleteHandle];
    [[UIApplication sharedApplication].delegate.window addSubview:view];
    return view;
}

-(instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subtitle btnName:(NSString *)btnName otherBtnName:(NSString *)otherBtnName btnComplete:(void(^)(void))btnCompleteHandle otherBtnComplete:(void(^)(void))otherBtnCompleteHandle
{
    if (self = [super init]) {
        self.title = title ;
        self.subtitle = subtitle ;
        self.btnName = btnName ;
        self.otherBtnName = otherBtnName;
        self.btnCompeleteHandle = btnCompleteHandle;
        self.otherBtnCompeleteHandle = otherBtnCompleteHandle;
        [self setup];
    }
    return self ;
}

-(void)setup{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    self.frame = [UIScreen mainScreen].bounds;
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    [self insertSubview:effectView atIndex:0];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
    
    self.containView = [UIView new];
    self.containView.backgroundColor = GaColor;
    BEEViewRadius(self.containView, BEEZoomW(4));
    [self addSubview:self.containView];
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(0);
        make.width.mas_offset(BEEZoomW(308));
        make.height.mas_offset(BEEZoomW(180));
    }];
    
    
    self.titleL = [UILabel new];
    self.titleL.text = self.title ;
    [self.containView addSubview:self.titleL];
    self.titleL.textColor = GbColor ;
    self.titleL.font = BEEBOLDSYSTEMFONT(16);
    self.titleL.textAlignment = NSTextAlignmentCenter ;
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.top.mas_offset(BEEZoomW(13));
    }];
    
    self.subtitleL = [UILabel new];
    self.subtitleL.text = self.subtitle ;
    [self.containView addSubview:self.subtitleL];
    self.subtitleL.numberOfLines = 0 ;
    self.subtitleL.textColor = GbColor ;
    self.subtitleL.font = BEESYSTEMFONT(14);
    self.subtitleL.textAlignment = NSTextAlignmentCenter ;
    [self.subtitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleL.mas_bottom).offset(BEEZoomW(32));
        make.left.mas_offset(BEEZoomW(27));
        make.right.mas_offset(-BEEZoomW(27));
    }];
    
    self.closeBtn = [UIButton new];
    [self.containView addSubview:self.closeBtn];
    [self.closeBtn setImage:LC_IMAGE(@"lhlc_remove") forState:0];
    [self.closeBtn setImage:LC_IMAGE(@"lhlc_remove") forState:UIControlStateHighlighted];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_offset(BEEZoomW(40));
        make.right.top.mas_offset(0);
    }];
    
    @weakify(self)
    [self.closeBtn jk_addActionHandler:^(NSInteger tag) {
        @strongify(self)
        [UIView animateWithDuration:0.3 animations:^{
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
    
    self.knowBtn = [UIButton new];
    BEEViewRadius(self.knowBtn, BEEZoomW(15));
    self.knowBtn.backgroundColor = BEEpColor ;
    [self.knowBtn setTitle:self.btnName forState:0];
    [self.knowBtn setTitleColor:GaColor forState:0];
    [self.knowBtn.titleLabel setFont:BEEBOLDSYSTEMFONT(15)];
    [self.containView addSubview:self.knowBtn];
    [self.knowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-BEEZoomW(26));
        make.left.mas_offset(BEEZoomW(10));
        make.width.mas_offset(BEEZoomW(120));
        make.height.mas_offset(BEEZoomW(30));
    }];
    
    [self.knowBtn jk_addActionHandler:^(NSInteger tag) {
        @strongify(self)
        [UIView animateWithDuration:0.3 animations:^{
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            !self.btnCompeleteHandle?:self.btnCompeleteHandle();
        }];
    }];

    
    self.otherBtn = [UIButton new];
    BEEViewRadius(self.otherBtn, BEEZoomW(15));
    self.otherBtn.backgroundColor = BEEpColor ;
    [self.otherBtn setTitle:self.otherBtnName forState:0];
    [self.otherBtn setTitleColor:GaColor forState:0];
    [self.otherBtn.titleLabel setFont:BEEBOLDSYSTEMFONT(15)];
    [self.containView addSubview:self.otherBtn];
    [self.otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-BEEZoomW(26));
        make.right.mas_offset(BEEZoomW(-10));
        make.width.mas_offset(BEEZoomW(120));
        make.height.mas_offset(BEEZoomW(30));
    }];
    
    [self.otherBtn jk_addActionHandler:^(NSInteger tag) {
        @strongify(self)
        [UIView animateWithDuration:0.3 animations:^{
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            !self.otherBtnCompeleteHandle?:self.otherBtnCompeleteHandle();
        }];
    }];
}

@end
