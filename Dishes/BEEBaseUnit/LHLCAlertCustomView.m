//
//  LHLCAlertCustomView.m
//  LHLC
//
//  Created by WalkerCloud on 2019/4/26.
//  Copyright © 2019年 Sameway. All rights reserved.
//

#import "LHLCAlertCustomView.h"


@interface LHLCAlertCustomView ()
@property (nonatomic , strong)UIView * containView;
@property (nonatomic , strong)UIImageView * iconImageV;
@property (nonatomic , strong)UILabel * titleL;
@property (nonatomic , strong)UILabel * subtitleL;
@property (nonatomic , strong)UIButton * closeBtn;

@property (nonatomic ,strong)NSString *title;
@property (nonatomic ,strong)NSString *subtitle;
@property (nonatomic ,strong)NSString *imageName;
@property (nonatomic ,copy) void(^compeleteHandle)(void);
@end

@implementation LHLCAlertCustomView

+(instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subtitle imageName:(NSString *)imageName complete:(void(^)(void))completeHandle
{
    LHLCAlertCustomView * view = [[self alloc] initWithTitle:title subTitle:subtitle imageName:imageName complete:completeHandle];
    [[UIApplication sharedApplication].delegate.window addSubview:view];
    return view;
}

-(instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subtitle imageName:(NSString *)imageName complete:(void(^)(void))completeHandle
{
    if (self = [super init]) {
        self.title = title ;
        self.subtitle = subtitle ;
        self.imageName = imageName ;
        self.compeleteHandle = completeHandle;
        [self setup];
    }
    return self ;
}

-(void)setup{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    self.frame = [UIScreen mainScreen].bounds;
    
    self.containView = [UIView new];
    self.containView.backgroundColor = GaColor;
    BEEViewRadius(self.containView, BEEZoomW(4));
    [self addSubview:self.containView];
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(0);
        make.width.mas_offset(BEEZoomW(313));
        make.height.mas_offset(BEEZoomW(220));
    }];
    
    self.iconImageV = [UIImageView new];
    self.iconImageV.image = LC_IMAGE(self.imageName);
    [self.containView addSubview:self.iconImageV];
    [self.iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.width.height.mas_offset(BEEZoomW(48));
        make.top.mas_offset(BEEZoomW(22));
    }];
    
    self.titleL = [UILabel new];
    self.titleL.text = self.title ;
    [self.containView addSubview:self.titleL];
    self.titleL.textColor = GbColor ;
    self.titleL.font = BEEBOLDSYSTEMFONT(18);
    self.titleL.textAlignment = NSTextAlignmentCenter ;
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.top.mas_equalTo(self.iconImageV.mas_bottom).offset(BEEZoomW(10));
    }];
    
    self.subtitleL = [UILabel new];
    self.subtitleL.text = self.subtitle ;
    [self.containView addSubview:self.subtitleL];
    self.subtitleL.numberOfLines = 0 ;
    self.subtitleL.textColor = GmColor ;
    self.subtitleL.font = BEESYSTEMFONT(16);
    self.subtitleL.textAlignment = NSTextAlignmentCenter ;
    [self.subtitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleL.mas_bottom).offset(BEEZoomW(14));
        make.left.mas_offset(BEEZoomW(35));
        make.right.mas_offset(-BEEZoomW(35));
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
}





@end
