//
//  BEEHomeShopsDetailView.m
//  Dishes
//
//  Created by Roddick on 2019/11/26.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeShopsDetailView.h"
#import "BEEHomeShopsDetailViewModel.h"
#import "BEEHomeShopsDetailServeViewModel.h"

@interface BEEHomeShopsDetailView ()

@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) BEEHomeShopsDetailViewModel * viewModel;
@property (nonatomic ,strong) BEEHomeShopsDetailServeViewModel * serveViewModel;
@property (nonatomic ,strong) UIView * headView;
@property (nonatomic ,strong) UIButton * likeBtn;

@property (nonatomic ,strong) UIImageView * headtopImageView;
@property (nonatomic ,strong) UILabel * headlabel0;
@property (nonatomic ,strong) UILabel * headlabel1;
@property (nonatomic ,strong) UILabel * headlabel2;
@end


@implementation BEEHomeShopsDetailView

-(void)initAppearValue
{
    self.tableView.tableHeaderView = self.headView ;
    self.viewModel = [[BEEHomeShopsDetailViewModel alloc]bindViewModelWithTableView:self.tableView];
    self.serveViewModel = [[BEEHomeShopsDetailServeViewModel alloc]bindServeViewMdoelWithTableView:self.tableView];
}

-(void)setDetailDic:(NSDictionary *)detailDic
{
    [super setDetailDic:detailDic];
    BEEHomeDetailModel * model = [BEEHomeDetailModel mj_objectWithKeyValues:self.detailDic];
    self.serveViewModel.model = model;
    self.headtopImageView.image = [UIImage imageNamed:model.imageName];
    self.headlabel0.text = model.title0;
    self.headlabel1.text = model.title1;
    self.headlabel2.text = model.title2;
    self.likeBtn.selected = [model.like boolValue];
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
        [self addSubview:_tableView];
    }
    return _tableView ;
}

-(UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEZoomW(250))];
        _headView.backgroundColor = UIColor.whiteColor;
        
        UIImageView * topImageView = [UIImageView new];
        self.headtopImageView = topImageView ;
        topImageView.contentMode = UIViewContentModeScaleToFill;
        [_headView addSubview:topImageView];
        
        UILabel * label0 = [UILabel new];
        self.headlabel0 = label0 ;
        label0.backgroundColor = BEEaColor;
        label0.text = @"-";
        label0.textAlignment = NSTextAlignmentCenter ;
        label0.textColor = BEEeColor ;
        label0.font = BEESYSTEMFONT(13) ;
        [_headView addSubview:label0];
        
        
        UILabel * label1 = [UILabel new];
        self.headlabel1 = label1 ;
        label1.text = @"-";
        label1.textColor = BEEcColor ;
        label1.font = BEEBOLDSYSTEMFONT(18);
        [_headView addSubview:label1];
        
        [_headView addSubview:self.likeBtn];
        
        UILabel * label2 = [UILabel new];
        self.headlabel2 = label2 ;
        label2.numberOfLines = 0 ;
        label2.textAlignment = NSTextAlignmentCenter ;
        label2.text = @"-";
        label2.textColor = BEElColor ;
        label2.font = BEESYSTEMFONT(13);
        [_headView addSubview:label2];
        
        UIView * line = [UIView new];
        line.backgroundColor = BEEdColor ;
        [_headView addSubview:line];
        
        [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_offset(0);
            make.height.mas_offset(BEEZoomW(160));
        }];
        
        @weakify(self)
        [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(topImageView.mas_bottom).offset(BEEZoomW(10));
            @strongify(self)
            make.right.mas_equalTo(self->_headView.mas_centerX).offset(BEEZoomW(-10));
            make.height.mas_offset(BEEZoomW(25));
            make.width.mas_offset(BEEZoomW(60));
        }];
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label0);
            make.left.mas_equalTo(self->_headView.mas_centerX).offset(BEEZoomW(5));
            make.height.mas_offset(BEEZoomW(25));
        }];
        
        [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label1);
            make.right.mas_offset(BEEZoomW(-13));
            make.width.height.mas_offset(23);
        }];
        
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label1.mas_bottom).mas_offset(BEEZoomW(15));
            make.centerX.mas_offset(0);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_offset(0);
            make.height.mas_offset(2);
        }];
    }
    return _headView ;
}

-(UIButton *)likeBtn
{
    if (!_likeBtn) {
        _likeBtn = [UIButton new];
        //[_likeBtn setImageEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
        [_likeBtn setImage:[UIImage imageNamed:@"icon_shoucang"] forState:UIControlStateNormal];
        [_likeBtn setImage:[UIImage imageNamed:@"icon_shou"] forState:UIControlStateSelected];
        [_likeBtn addTarget:self action:@selector(likeClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn ;
}

-(void)likeClick:(UIButton *)sender
{
    sender.selected = !sender.selected ;
}

@end
