//
//  BEEMineDraftView.m
//  Dishes
//
//  Created by Roddick on 2019/11/28.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineDraftView.h"
#import "BEEMineDraftViewModel.h"
#import "BEEMineDraftServeViewModel.h"
#import "BEEMineDishesShopsModel.h"

@interface BEEMineDraftView ()
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) LHLCHeadPageView * pageView;
@property (nonatomic ,assign) NSInteger index ;
@property (nonatomic ,strong) BEEMineDraftViewModel * viewModel ;
@property (nonatomic ,strong) BEEMineDraftServeViewModel * serveViewModel;
@property (nonatomic ,strong) UIButton * subBtn;
@end

@implementation BEEMineDraftView

-(void)initAppearValue
{
    [self addSubview:self.pageView];
    self.viewModel = [[BEEMineDraftViewModel alloc] bindViewModelWithTableView:self.tableView];
    [self.serveViewModel = [BEEMineDraftServeViewModel alloc] bindServeViewMdoelWithTableView:self.tableView];
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
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, BEEZoomW(50), BEEW, BEEH-BEEZoomW(50) - BEENavigationBarHeight) style:UITableViewStylePlain];
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
        [YBProgressHUD showInfoMessage:@"您还没有勾选！"];
        return;
    }
    [self.tableView reloadData];
}

-(LHLCHeadPageView *)pageView{
    if (_pageView == nil) {
        NSArray *titles ;
        titles = @[@"菜谱",@"好馆"];
        _pageView = [[LHLCHeadPageView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEZoomW(50)) items:titles backgroundColor:UIColor.whiteColor seletedBackgroundColor:BEEjColor];
        @weakify(self)
        _pageView.currentIndexBlock = ^(NSInteger index) {
            @strongify(self)
            [self.tableView.mj_header beginRefreshing];
            [self.serveViewModel.datas removeAllObjects];
            if (index == 100) {
                NSArray * dataArray = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:[BEEHelpTool arrayWithJson:@"BEEMineMyDraftDishes"]];
                self.serveViewModel.datas = dataArray.mutableCopy ;
            }else{
                NSArray * dataArray = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:[BEEHelpTool arrayWithJson:@"BEEMineMyDraftShops"]];
                self.serveViewModel.datas = dataArray.mutableCopy ;
            }
            [self.tableView reloadData];
        };
    }
    return _pageView ;
}
@end
