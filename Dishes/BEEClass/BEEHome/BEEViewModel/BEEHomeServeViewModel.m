//
//  BEEHomeServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeServeViewModel.h"
#import "BEEHSectionView.h"
#import "BEEHomeHorizontalCell.h"
#import "BEEHomeStyleCell.h"

#import "BEEDataManager.h"

static NSString * reuseID = @"BEEProductListCell";
static NSString * BEEHomeHorizontalCellReuseID = @"BEEHomeHorizontalCellReuseID";
static NSString * BEEHomeStyleCellReuseID = @"BEEHomeStyleCellReuseID";

@interface BEEHomeServeViewModel ()
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,copy) NSArray * dishesDatas;
@property (nonatomic ,copy) NSArray * shopsDatas;
@property (nonatomic ,copy) NSArray * newestdishesDatas;
@end

@implementation BEEHomeServeViewModel

-(instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView
{
    if (self == [super bindServeViewMdoelWithTableView:tableView]) {
        self.dishesDatas = [BEEDataManager sharedBEEDataManager].dishesDatas;
        self.shopsDatas = [BEEDataManager sharedBEEDataManager].shopsDatas;
        self.newestdishesDatas = [BEEDataManager sharedBEEDataManager].newestdishesDatas;

        self.tableView = tableView ;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
        tableView.backgroundColor = GaColor;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 157;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        [tableView registerClass:[BEEHomeHorizontalCell class] forCellReuseIdentifier:BEEHomeHorizontalCellReuseID];
        [tableView registerClass:[BEEHomeStyleCell class] forCellReuseIdentifier:BEEHomeStyleCellReuseID];
        //[tableView registerNib:[UINib nibWithNibName:@"BEEHomeCell" bundle:nil] forCellReuseIdentifier:reuseID];
    }
    return self ;
}

-(void)bee_initialize
{
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGFLOAT_MIN ;
    }
    return BEEZoomW(40) ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    NSArray * titles = @[@"",@"人气菜谱TOP5",@"有家好馆TOP5"];
    BEEHSectionView * sectionV = [[BEEHSectionView alloc]initWithTitle:titles[section]];
    sectionV.frame = CGRectMake(0, 0, BEEW, BEEZoomW(40));
    return sectionV;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        BEEMineDishesShopsModel *model = self.dishesDatas[indexPath.row];
        NSString * url = [NSString stringWithFormat:@"BEERouter://push/BEEHomeDiesDetailController/%@",[BEEMineDishesShopsModel jsonStringWithNSDictionary:model.detail]];
        [YBRoutes openURL:url];
    }
    if (indexPath.section == 2) {
        BEEMineDishesShopsModel *model = self.shopsDatas[indexPath.row];
        NSString * url = [NSString stringWithFormat:@"BEERouter://push/BEEHomeShopsDetailController/%@",[BEEMineDishesShopsModel jsonStringWithNSDictionary:model.detail]];
        [YBRoutes openURL:url];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return self.dishesDatas.count <= 5 ?:5 ;
    }
    return self.shopsDatas.count  <= 5 ?:5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3 ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        BEEHomeHorizontalCell *cell = [tableView dequeueReusableCellWithIdentifier:BEEHomeHorizontalCellReuseID];
        if (!cell) {
            cell = [[BEEHomeHorizontalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BEEHomeHorizontalCellReuseID];
        }
        cell.newestDatas = self.newestdishesDatas ;
        return cell;
    }
    BEEHomeStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:BEEHomeStyleCellReuseID];
    if (!cell) {
        cell = [[BEEHomeStyleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BEEHomeStyleCellReuseID];
    }
    cell.model = indexPath.section == 1 ? self.dishesDatas[indexPath.row] : self.shopsDatas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return BEEZoomW(192) ;
    }
    return BEEZoomW(130);
}

@end
