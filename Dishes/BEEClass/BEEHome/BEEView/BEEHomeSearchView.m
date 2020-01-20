//
//  BEEHomeSearchView.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeSearchView.h"
#import "BEEHomeView.h"
#import "BEEHomeSearchServeViewModel.h"

@interface BEEHomeSearchView ()
@property (nonatomic ,strong) BEEHomeTopBar * topBar;
@property (nonatomic ,strong) UILabel * tLabel ;
@property (nonatomic ,strong) UICollectionView * collectionView;
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) BEEHomeSearchServeViewModel * serveViewModel;
@property (nonatomic ,strong) UIView * noResultView;
@property (nonatomic ,strong) UIButton * subBtn;
@end

@implementation BEEHomeSearchView

-(void)initAppearValue
{
    self.backgroundColor = BEEsColor ;
    [self addSubview:self.topBar];
    
    [self addSubview:self.tLabel];
    
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topBar.mas_bottom).offset(BEEZoomW(15));
        make.left.mas_offset(BEEZoomW(12));
    }];
    
    UIView * line = [UIView new];
    line.backgroundColor = BEErColor ;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tLabel.mas_bottom).offset(BEEZoomW(5));
        make.left.right.mas_offset(0);
        make.height.mas_offset(1);
    }];
    
    [self.serveViewModel = [BEEHomeSearchServeViewModel alloc] bindServeViewModelWithCollectionView:self.collectionView tableView:self.tableView];
    @weakify(self)
    self.serveViewModel.selectedHandle = ^(NSString * _Nonnull title) {
        @strongify(self)
        self.tLabel.text = @"搜索到1个结果";
        self.topBar.textField.text = title;
        self.collectionView.hidden = YES ;
        [self addSubview:self.tableView];
        [self.tableView reloadData];
    };
}

-(BEEHomeTopBar *)topBar
{
    if (!_topBar) {
        _topBar = [[BEEHomeTopBar alloc]initWithFrame:CGRectMake(0, 0, BEEW , BEENavigationBarHeight) barStyle:BEEHomeStyleCellStyleArrow];
        _topBar.textField.returnKeyType = UIReturnKeySearch;
        @weakify(self)
        [_topBar.textField setJk_shouldReturnBlock:^BOOL(UITextField *textField) {
            @strongify(self)
            NSString *key = textField.text;
            if (key.length <= 0) {
                [YBProgressHUD showErrorMessage:@"请输入搜索关键字"];
                return NO ;
            }
            self.tLabel.text = @"搜索到0个结果";
            if ([self.tableView isDescendantOfView:self]) {
                [self.tableView removeFromSuperview];
            }
            self.collectionView.hidden = YES ;
            [self addSubview:self.noResultView];
            [self endEditing:YES];
            return key.length > 0;
        }];
    }
    return _topBar  ;
}


-(UILabel *)tLabel
{
    if (!_tLabel) {
        _tLabel = [UILabel new];
        _tLabel.text = @"热门搜索";
        _tLabel.textColor = BEEcColor;
        _tLabel.font = BEESYSTEMFONT(14);
    }
    return _tLabel ;
}


-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(BEEZoomW(75), BEEZoomW(30));
        layout.minimumInteritemSpacing = BEEZoomW(30);
        layout.minimumLineSpacing = BEEZoomW(30);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(BEEZoomW(45), BEEZoomW(45), BEEZoomW(45), BEEZoomW(45));
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, BEENavigationBarHeight + BEEZoomW(40), BEEW, BEEH-BEEZoomW(40) - BEENavigationBarHeight) collectionViewLayout:layout];
        [self addSubview:_collectionView];
    }
    return _collectionView ;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, BEENavigationBarHeight + BEEZoomW(40), BEEW, BEEH-BEEZoomW(40) - BEENavigationBarHeight) style:UITableViewStylePlain];
    }
    return _tableView ;
}

-(UIView *)noResultView
{
    if (!_noResultView) {
        _noResultView = [[UIView alloc]initWithFrame:CGRectMake(0, BEENavigationBarHeight + BEEZoomW(40), BEEW, BEEH-BEEZoomW(40) - BEENavigationBarHeight)];
        _noResultView.backgroundColor = UIColor.clearColor ;
        
        UILabel * label0 = [UILabel new];
        label0.text = @"运气不好，没有找到你要的菜谱";
        label0.textAlignment = NSTextAlignmentCenter ;
        label0.textColor = BEElColor;
        label0.font = BEESYSTEMFONT(14);
        [_noResultView addSubview:label0];
        [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(BEEZoomW(100));
            make.centerX.mas_offset(0);
            make.width.mas_offset(BEEZoomW(200));
        }];
        
        UIView * line0 = [UIView new];
        line0.backgroundColor = BEErColor;
        [_noResultView addSubview:line0];
        [line0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label0);
            make.right.mas_equalTo(label0.mas_left).offset(BEEZoomW(-20));
            make.height.mas_offset(1);
            make.width.mas_offset(45);
        }];
        
        UIView * line1 = [UIView new];
        line1.backgroundColor = BEErColor;
        [_noResultView addSubview:line1];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label0);
            make.left.mas_equalTo(label0.mas_right).offset(BEEZoomW(20));
            make.height.mas_offset(1);
            make.width.mas_offset(45);
        }];
        
        UIImageView *iconImageV = [UIImageView new];
        iconImageV.image = [UIImage imageNamed:@"btn_"];
        [_noResultView addSubview:iconImageV];
        [iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label0.mas_bottom).offset(100);
            make.centerX.mas_offset(0);
            make.height.width.mas_offset(90);
        }];
        
        [_noResultView addSubview:self.subBtn];
        [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
               make.left.mas_offset((BEEW-BEEZoomW(343))/2);
               make.top.mas_equalTo(iconImageV.mas_bottom).offset(BEEZoomW(160));
               make.width.mas_offset(BEEZoomW(343));
               make.height.mas_offset(BEEZoomW(32));
        }];
        
        
        UILabel * label1 = [UILabel new];
        label1.text = @"立即上传上海菜谱，振兴上海菜";
        label1.textAlignment = NSTextAlignmentCenter ;
        label1.textColor = BEElColor;
        label1.font = BEEBOLDSYSTEMFONT(15);
        [_noResultView addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.subBtn.mas_bottom).offset(BEEZoomW(10));
            make.centerX.mas_offset(0);
            make.width.mas_offset(BEEW-40);
        }];
        
    }
    return _noResultView ;
}

-(UIButton *)subBtn
{
    if (!_subBtn) {
        _subBtn = [UIButton new];
        [_subBtn setTitle:@"立即上传" forState:UIControlStateNormal];
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
    [YBRoutes openURL:@"BEERouter://push/BEEIssueDishesController"];
}


@end
