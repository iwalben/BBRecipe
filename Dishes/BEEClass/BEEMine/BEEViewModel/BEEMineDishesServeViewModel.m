//
//  BEEMineDishesServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineDishesServeViewModel.h"
#import "BEEHomeStyleCell.h"

static NSString * BEEMineDishesServeCellReuseID = @"BEEMineDishesServeViewModelCellReuseID";

@interface BEEMineDishesServeViewModel ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView ;
@end


@implementation BEEMineDishesServeViewModel
-(instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView
{
    if (self == [super bindServeViewMdoelWithTableView:tableView]) {
        NSArray * dataArray = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:[BEEHelpTool arrayWithJson:@"BEEMineMyDishes"]];
        self.datas = [NSMutableArray arrayWithArray:dataArray];
        self.tableView = tableView ;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
        tableView.backgroundColor = GaColor;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 157;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        [tableView registerClass:[BEEMineDishesShopsCell class] forCellReuseIdentifier:BEEMineDishesServeCellReuseID];
        
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
    BEEMineDishesShopsModel * model = self.datas[indexPath.row];
    model.isSelected = !model.isSelected ;
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BEEMineDishesShopsCell *cell = [tableView dequeueReusableCellWithIdentifier:BEEMineDishesServeCellReuseID];
    if (!cell) {
        cell = [[BEEMineDishesShopsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BEEMineDishesServeCellReuseID];
    }
    cell.model = self.datas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return BEEZoomW(130);
}
@end
