//
//  BEEMIneView.m
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineView.h"
#import "BEEMineViewModel.h"
#import "BEEMineServeViewModel.h"

@interface BEEMineView ()
@property (nonatomic ,strong) UITableView * tableView ;
@property (nonatomic ,strong) BEEMineViewModel * viewModel ;
@property (nonatomic ,strong) BEEMineServeViewModel * serveViewModel ;
@end

@implementation BEEMineView

-(void)initAppearValue
{
    self.tableView.tableHeaderView = [self headView] ;
    self.viewModel = [[BEEMineViewModel alloc] bindViewModelWithTableView:self.tableView];
    self.serveViewModel = [[BEEMineServeViewModel alloc] bindServeViewMdoelWithTableView:self.tableView];
}


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -BEEStatusBarHeight, BEEW, BEEH - BEETabbarBottomHeight +  BEEStatusBarHeight) style:UITableViewStyleGrouped];
        [self addSubview:_tableView];
    }
    return _tableView ;
}

-(UIView *)headView
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEZoomW(150))];
    view.backgroundColor = BEEaColor;
    
    UIImageView * headImageC = [UIImageView new];
    headImageC.image = [UIImage imageNamed:@"pic_zhaopian"];
    [view addSubview:headImageC];
    
    [headImageC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(BEEZoomW(20));
        make.bottom.mas_offset(BEEZoomW(-20));
        make.width.height.mas_offset(BEEZoomW(55));
    }];
    
    UILabel * label0 = [UILabel new];
    label0.backgroundColor = BEEaColor;
    //label0.text = @"立即登录/注册";
    label0.text = @"Cedar";
    label0.textColor = BEEeColor ;
    label0.font = BEESYSTEMFONT(13);
    [view addSubview:label0];
    
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headImageC.mas_right).offset(BEEZoomW(17));
        make.top.mas_equalTo(headImageC.mas_top).offset(BEEZoomW(5));
        make.height.mas_offset(BEEZoomW(20));
    }];
    
    UILabel * label1 = [UILabel new];
    label1.backgroundColor = BEEaColor;
    //label1.text = @"登录后可以发布或收藏菜谱";
    label1.text = @"最后登录时间：5分钟前";
    label1.textColor = BEEoColor ;
    label1.font = BEESYSTEMFONT(12);
    [view addSubview:label1];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headImageC.mas_right).offset(BEEZoomW(17));
        make.top.mas_equalTo(label0.mas_bottom).offset(BEEZoomW(10));
        make.height.mas_offset(BEEZoomW(20));
    }];
    return view;
}


@end

#pragma mark - BEEMineCell -

@interface BEEMineCell ()
@property (nonatomic ,strong) UIImageView * arrowImageView;
@end

@implementation BEEMineCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone ;
        self.backgroundColor = UIColor.whiteColor  ;
        [self.contentView addSubview:self.tLabel];
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.arrowImageView];
        
        UIView * line = [UIView new];
        line.backgroundColor = BEEnColor ;
        [self.contentView addSubview:line];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(BEEZoomW(20));
            make.centerY.mas_offset(0);
            make.width.height.mas_offset(BEEZoomW(18));
        }];
        
        [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImageView.mas_right).offset(BEEZoomW(12));
            make.centerY.mas_offset(0);
        }];
        
        [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-BEEZoomW(20));
            make.centerY.mas_offset(0);
            make.width.mas_offset(BEEZoomW(13));
            make.height.mas_offset(BEEZoomW(20));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_offset(0);
            make.height.mas_offset(1);
        }];
        
        
    }
    return self ;
}

-(UILabel *)tLabel
{
    if(!_tLabel){
        _tLabel = [UILabel new];
        _tLabel.font = [UIFont systemFontOfSize:BEEZoomW(14)];
        _tLabel.textColor = BEEeColor;
        _tLabel.text = @"-";
    }
    return _tLabel ;
}

-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView ;
}

-(UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [UIImageView new];
        _arrowImageView.image = [UIImage imageNamed:@"icon_arrow"];
    }
    return _arrowImageView ;
}


@end
