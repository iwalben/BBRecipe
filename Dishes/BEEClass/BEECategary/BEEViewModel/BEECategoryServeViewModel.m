//
//  BEECategoryServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEECategoryServeViewModel.h"
#import "BEECategoryView.h"
#import "BEEMineDishesShopsModel.h"

@interface BEECategoryServeViewModel ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong) UICollectionView * collectionView ;

@end

static NSString * reuseID = @"BEECategoryServeViewModelCellID";

@implementation BEECategoryServeViewModel

-(instancetype)bindServeViewModelWithCollectionView:(UICollectionView *)collectionView
{
    if (self == [super bindServeViewModelWithCollectionView:collectionView]) {
        self.dishesDatas = [BEEDataManager sharedBEEDataManager].dishesDatas;
        self.collectionView = collectionView ;
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        [self.collectionView setShowsHorizontalScrollIndicator:NO];
        self.collectionView.backgroundColor = UIColor.whiteColor;
        [self.collectionView registerClass:[BEECategoryItemCell class] forCellWithReuseIdentifier:@"BEEHomeHorizontalItemCellID"];
    }
    return self ;
}


#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BEEMineDishesShopsModel *model = self.dishesDatas[indexPath.row];
    NSString * url = [NSString stringWithFormat:@"BEERouter://push/BEEHomeDiesDetailController/%@",[BEEMineDishesShopsModel jsonStringWithNSDictionary:model.detail]];
    [YBRoutes openURL:url];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dishesDatas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BEECategoryItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BEEHomeHorizontalItemCellID" forIndexPath:indexPath];
    BEEMineDishesShopsModel * model = self.dishesDatas[indexPath.row];
    cell.model = [BEEHomeDetailModel mj_objectWithKeyValues:model.detail];
    return cell;
}


@end
