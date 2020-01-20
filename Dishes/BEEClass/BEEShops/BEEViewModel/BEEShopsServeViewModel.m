//
//  BEEShopsServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEShopsServeViewModel.h"
#import "BEEHomeStyleCell.h"
#import "BEEMineDishesShopsModel.h"

static NSString * reuseID = @"BEEShopsServeViewModelCellID";

@interface BEEShopsServeViewModel ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView;

@end

@implementation BEEShopsServeViewModel

-(instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView
{
    if (self == [super bindServeViewMdoelWithTableView:tableView]) {
        self.shopsDatas = [BEEDataManager sharedBEEDataManager].shopsDatas;
        _tableView = tableView ;
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        _tableView.rowHeight = BEEZoomW(130);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerClass:[BEEHomeStyleCell class] forCellReuseIdentifier:reuseID];
    }
    return self ;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.shopsDatas.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BEEHomeStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[BEEHomeStyleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.model = self.shopsDatas[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BEEMineDishesShopsModel *model = self.shopsDatas[indexPath.row];
    NSString * url = [NSString stringWithFormat:@"BEERouter://push/BEEHomeShopsDetailController/%@",[BEEMineDishesShopsModel jsonStringWithNSDictionary:model.detail]];
    [YBRoutes openURL:url];
}

@end
