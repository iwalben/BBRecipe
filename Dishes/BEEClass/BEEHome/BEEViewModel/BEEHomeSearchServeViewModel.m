//
//  BEEHomeSearchServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeSearchServeViewModel.h"
#import "BEECategoryView.h"
#import "BEEHomeStyleCell.h"

static NSString * reuseID = @"BEEHomeSearchServeViewModelCellID";
static NSString * BEEHomeSearchCellReuseID = @"BEEHomeSearchServeViewModelCellReuseID";

@interface BEEHomeSearchServeViewModel ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic ,strong) UICollectionView * collectionView ;
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,copy) NSArray * dishesDatas ;
@property (nonatomic ,strong) BEEMineDishesShopsModel * selectedModel;
@end

@implementation BEEHomeSearchServeViewModel

-(instancetype)bindServeViewModelWithCollectionView:(UICollectionView *)collectionView tableView:(UITableView *)tableView
{
    if (self == [super bindServeViewModelWithCollectionView:collectionView tableView:tableView]) {
        self.tableView = tableView ;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        tableView.backgroundColor = GaColor;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 157;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        [tableView registerClass:[BEEHomeStyleCell class] forCellReuseIdentifier:BEEHomeSearchCellReuseID];
        
        
        self.dishesDatas = [BEEDataManager sharedBEEDataManager].dishesDatas;
        self.collectionView = collectionView ;
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        [self.collectionView setShowsHorizontalScrollIndicator:NO];
        self.collectionView.backgroundColor = UIColor.clearColor;
        [self.collectionView registerClass:[BEECategoryItemCell class] forCellWithReuseIdentifier:reuseID];
    }
    return self;
}


#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedModel = self.dishesDatas[indexPath.row]; ;
    !self.selectedHandle?:self.selectedHandle(self.selectedModel.detail[@"title1"]);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dishesDatas.count <= 6 ?:6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BEECategoryItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    BEEMineDishesShopsModel * model = self.dishesDatas[indexPath.row];
    cell.model = [BEEHomeDetailModel mj_objectWithKeyValues:model.detail];
    return cell;
}


#pragma mark - UITableViewDelegate,UITableViewDataSource


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * url = [NSString stringWithFormat:@"BEERouter://push/BEEHomeDiesDetailController/%@",[BEEMineDishesShopsModel jsonStringWithNSDictionary:self.selectedModel.detail]];
    [YBRoutes openURL:url];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BEEHomeStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:BEEHomeSearchCellReuseID];
    if (!cell) {
        cell = [[BEEHomeStyleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BEEHomeSearchCellReuseID];
    }
    cell.model = self.selectedModel ;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return BEEZoomW(130);
}

@end
