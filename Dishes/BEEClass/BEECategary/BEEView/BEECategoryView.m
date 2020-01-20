//
//  BEECategoryView.m
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEECategoryView.h"
#import "BEECategoryViewModel.h"
#import "BEECategoryServeViewModel.h"

@interface BEECategoryView ()
@property (nonatomic ,strong) UICollectionView * collectionView;
@property (nonatomic ,strong) BEECategoryHeadPageView * pageView;
@property (nonatomic ,assign) NSInteger index ;
@property (nonatomic ,strong) BEECategoryServeViewModel * serveViewModel;
@property (nonatomic ,strong) BEECategoryViewModel * viewModel;
@property (nonatomic ,strong) UIView * noResultView;
@property (nonatomic ,strong) UIButton * subBtn;
@end

@implementation BEECategoryView

-(void)initAppearValue
{
    [self addSubview:self.pageView];
    self.viewModel = [[BEECategoryViewModel alloc]bindViewModelWithCollectionView:self.collectionView];
    [self.serveViewModel = [BEECategoryServeViewModel alloc] bindServeViewModelWithCollectionView:self.collectionView];
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
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, BEEZoomW(70), BEEW, self.jk_height-BEEZoomW(70)-BEETabbarBottomHeight - BEENavigationBarHeight) collectionViewLayout:layout];
        [self addSubview:_collectionView];
    }
    return _collectionView ;
}


-(BEECategoryHeadPageView *)pageView{
    if (_pageView == nil) {
        NSArray *titles , * normalImages , * selectedImages ;
        titles = @[@"热炒",@"凉菜",@"点心",@"面食",@"煲/汤"];
        normalImages = @[@"icon_热炒",@"icon_凉菜",@"icon_点心",@"icon_面食",@"icon_汤"];
        selectedImages = @[@"icon_热炒",@"icon_凉菜",@"icon_点心",@"icon_面食",@"icon_汤"];
        _pageView = [[BEECategoryHeadPageView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEZoomW(70)) titleItems:titles imageNormalItems:normalImages imageSelectedItems:selectedImages];
        @weakify(self)
        _pageView.currentIndexBlock = ^(NSInteger index) {
            @strongify(self)
            [self.collectionView.mj_header beginRefreshing];
            if (index > 100) {
                self.serveViewModel.dishesDatas = [NSArray array];
                [self.collectionView addSubview:self.noResultView];
            }else{
                self.serveViewModel.dishesDatas = [BEEDataManager sharedBEEDataManager].dishesDatas;
                if ([self.noResultView isDescendantOfView:self.collectionView]) {
                    [self.noResultView removeFromSuperview];
                }
            }
            [self.collectionView reloadData];
        };
    }
    return _pageView ;
}


-(UIView *)noResultView
{
    if (!_noResultView) {
        _noResultView = [[UIView alloc]initWithFrame:self.collectionView.frame];
        _noResultView.backgroundColor = UIColor.clearColor ;
        
        UILabel * label0 = [UILabel new];
        label0.text = @"抱歉,暂时还没有人上传该类菜谱!";
        label0.textAlignment = NSTextAlignmentCenter ;
        label0.textColor = BEElColor;
        label0.font = BEESYSTEMFONT(14);
        [_noResultView addSubview:label0];
        [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(BEEZoomW(100));
            make.centerX.mas_offset(0);
            make.width.mas_offset(BEEZoomW(210));
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
        
        UILabel * label1 = [UILabel new];
        label1.text = @"立即上传上海菜谱，振兴上海菜";
        label1.textAlignment = NSTextAlignmentCenter ;
        label1.textColor = BEElColor;
        label1.font = BEEBOLDSYSTEMFONT(15);
        [_noResultView addSubview:label1];

        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_offset(-BEEZoomW(80));
            make.centerX.mas_offset(0);
            make.width.mas_offset(BEEW-40);
            make.height.mas_offset(30);
        }];
        
        
        [_noResultView addSubview:self.subBtn];
        [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset((BEEW-BEEZoomW(343))/2);
            make.bottom.mas_equalTo(label1.mas_top).mas_offset(-15);
            make.width.mas_offset(BEEZoomW(343));
            make.height.mas_offset(BEEZoomW(32));
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


@interface BEECategoryItemCell ()
@property (nonatomic ,strong) UIImageView *imageView;
@property (nonatomic ,strong) UILabel *titleLabel;
@end

@implementation BEECategoryItemCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initializeView];
    }
    return self;
}

- (void)initializeView{

    self.titleLabel = [UILabel new];
    self.titleLabel.textAlignment = NSTextAlignmentCenter ;
    self.titleLabel.font = [UIFont systemFontOfSize:BEEZoomW(13)];
    self.titleLabel.textColor = BEEeColor;
    self.titleLabel.text = @"-";
    [self.contentView addSubview:self.titleLabel];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = BEEdColor;
    [self.contentView insertSubview:bgView atIndex:0];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(0);
    }];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
}

-(void)setModel:(BEEHomeDetailModel *)model
{
    _model = model ;
    self.titleLabel.text = model.title1;
}
@end
