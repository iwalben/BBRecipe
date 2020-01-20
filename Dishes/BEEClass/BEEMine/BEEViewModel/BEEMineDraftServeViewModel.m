//
//  BEEMineDraftServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/28.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineDraftServeViewModel.h"
#import "BEEHomeStyleCell.h"


static NSString * BEEMineDraftServeCellReuseID = @"BEEMineDraftServeViewModelCellReuseID";

@interface BEEMineDraftServeViewModel ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView ;
@end

@implementation BEEMineDraftServeViewModel
-(instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView
{
    if (self == [super bindServeViewMdoelWithTableView:tableView]) {
        NSArray * dataArray = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:[BEEHelpTool arrayWithJson:@"BEEMineMyDraftDishes"]];
        self.datas = dataArray.mutableCopy ;
        self.tableView = tableView ;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
        tableView.backgroundColor = GaColor;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 157;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        [tableView registerClass:[BEEMineDishesShopsCell class] forCellReuseIdentifier:BEEMineDraftServeCellReuseID];
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

    BEEMineDishesShopsCell *cell = [tableView dequeueReusableCellWithIdentifier:BEEMineDraftServeCellReuseID];
    if (!cell) {
        cell = [[BEEMineDishesShopsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BEEMineDraftServeCellReuseID];
    }
    cell.model = self.datas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return BEEZoomW(130);
}
@end
