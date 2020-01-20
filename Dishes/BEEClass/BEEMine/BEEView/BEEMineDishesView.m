//
//  BEEMineDishesView.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineDishesView.h"
#import "BEEMineDishesServeViewModel.h"
#import "BEEMineDishesShopsModel.h"


@interface BEEMineDishesView ()
@property (nonatomic ,strong) UITableView * tableView ;
@property (nonatomic ,strong) BEEMineDishesServeViewModel * serveViewModel ;
@property (nonatomic ,strong) UIButton * subBtn;
@end

@implementation BEEMineDishesView

-(void)initAppearValue
{
    self.serveViewModel = [[BEEMineDishesServeViewModel alloc] bindServeViewMdoelWithTableView:self.tableView];
    [self addSubview:self.subBtn];
    [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.bottom.mas_offset(-200);
        make.width.mas_offset(BEEZoomW(343));
        make.height.mas_offset(BEEZoomW(32));
    }];
}


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        [self addSubview:_tableView];
    }
    return _tableView ;
}

-(UIButton *)subBtn
{
    if (!_subBtn) {
        _subBtn = [UIButton new];
        [_subBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_subBtn.titleLabel setFont:BEESYSTEMFONT(16)];
        [_subBtn setTitleColor:GaColor forState:UIControlStateNormal];
        BEEViewRadius(_subBtn, BEEZoomW(16));
        [_subBtn setBackgroundImage:[UIImage jk_imageWithColor:BEEpColor] forState:UIControlStateNormal];
        [_subBtn addTarget:self action:@selector(deletedClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subBtn ;
}

-(void)deletedClick
{
    NSArray * array = self.serveViewModel.datas.copy ;
    if (array.count <= 0 ) {
        [YBProgressHUD showInfoMessage:@"您还没有发布菜谱！"];
        return;
    }
    BOOL selected = NO ;
    for (BEEMineDishesShopsModel * model in array) {
        if (model.isSelected) {
            selected = YES ;
            [self.serveViewModel.datas removeObject:model];
        }
    }
    if (!selected) {
        [YBProgressHUD showInfoMessage:@"您还没有勾选相关菜谱！"];
        return;
    }
    [self.tableView reloadData];
}
@end

