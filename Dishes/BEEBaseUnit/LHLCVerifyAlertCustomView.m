//
//  LHLCVerifyAlertCustomView.m
//  LHLC
//
//  Created by WalkerCloud on 2019/4/28.
//  Copyright © 2019 Sameway. All rights reserved.
//
#import "LHLCVerifyAlertCustomView.h"

@interface LHLCVerifyAlertCustomView ()

@property (nonatomic , strong)UIView * containView;
@property (nonatomic , strong)UILabel * titleL;
@property (nonatomic , strong)UILabel * subtitleL;
@property (nonatomic , strong)UIButton * closeBtn;
@property (nonatomic , strong)UIButton * knowBtn;

@property (nonatomic ,strong)NSString *title;
@property (nonatomic ,strong)NSString *subtitle;

@property (nonatomic ,copy) void(^compeleteHandle)(void);
@end

@implementation LHLCVerifyAlertCustomView

+(instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subtitle complete:(void(^)(void))completeHandle
{
    LHLCVerifyAlertCustomView * view = [[self alloc] initWithTitle:title subTitle:subtitle complete:completeHandle];
    [[UIApplication sharedApplication].delegate.window addSubview:view];
    return view;
}

-(instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subtitle complete:(void(^)(void))completeHandle
{
    if (self = [super init]) {
        self.title = title ;
        self.subtitle = subtitle ;
        self.compeleteHandle = completeHandle;
        [self setup];
    }
    return self ;
}

-(void)setup{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    self.frame = [UIScreen mainScreen].bounds;
    
    self.containView = [UIView new];
    self.containView.backgroundColor = GaColor;
    BEEViewRadius(self.containView, BEEZoomW(4));
    [self addSubview:self.containView];
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(0);
        make.width.mas_offset(BEEZoomW(308));
        make.height.mas_offset(BEEZoomW(228));
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
            !self.compeleteHandle?:self.compeleteHandle();
        }];
    }];
    
    self.knowBtn = [UIButton new];
    BEEViewRadius(self.knowBtn, BEEZoomW(20));
    self.knowBtn.backgroundColor = BEEpColor ;
    [self.knowBtn setTitle:@"我知道了" forState:0];
    [self.knowBtn setTitleColor:GaColor forState:0];
    [self.knowBtn.titleLabel setFont:BEEBOLDSYSTEMFONT(15)];
    [self.containView addSubview:self.knowBtn];
    [self.knowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-BEEZoomW(26));
        make.centerX.mas_offset(0);
        make.width.mas_offset(BEEZoomW(120));
        make.height.mas_offset(BEEZoomW(40));
    }];
    
    [self.knowBtn jk_addActionHandler:^(NSInteger tag) {
        @strongify(self)
        [UIView animateWithDuration:0.3 animations:^{
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            !self.compeleteHandle?:self.compeleteHandle();
        }];
    }];

}

@end
