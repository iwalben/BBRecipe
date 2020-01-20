//
//  BEEMineCollectServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineCollectServeViewModel.h"
#import "BEEHomeStyleCell.h"

static NSString * BBEEMineCollectServeCellReuseID = @"BEEMineCollectServeViewModelCellReuseID";


@interface BEEMineCollectServeViewModel ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView ;
@property (nonatomic) NSArray * myCollectDatas ;
@end


@implementation BEEMineCollectServeViewModel
-(instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView
{
    if (self == [super bindServeViewMdoelWithTableView:tableView]) {
        self.myCollectDatas = [BEEDataManager sharedBEEDataManager].dishesDatas;
        self.tableView = tableView ;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
        tableView.backgroundColor = GaColor;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 157;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        [tableView registerClass:[BEEHomeStyleCell class] forCellReuseIdentifier:BBEEMineCollectServeCellReuseID];
        
        @weakify(self)
        self.tableView.mj_header = [BEERefreshHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                @strongify(self)
                [self.tableView.mj_header endRefreshing];
            });
        }];
    }
    return self ;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BEEMineDishesShopsModel *model = self.myCollectDatas[indexPath.row];
    NSString * url = [NSString stringWithFormat:@"BEERouter://push/BEEHomeDiesDetailController/%@",[BEEMineDishesShopsModel jsonStringWithNSDictionary:model.detail]];
    [YBRoutes openURL:url];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myCollectDatas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BEEHomeStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:BBEEMineCollectServeCellReuseID];
    if (!cell) {
        cell = [[BEEHomeStyleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BBEEMineCollectServeCellReuseID];
    }
    cell.model = self.myCollectDatas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return BEEZoomW(130);
}
@end
