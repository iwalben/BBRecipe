//
//  BEEMineServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineServeViewModel.h"
#import "BEEMineView.h"

static NSString * reuseID = @"BEEMineServeViewModelCellID";

@interface BEEMineServeViewModel ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView ;
@end

@implementation BEEMineServeViewModel

-(instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView
{
    if (self == [super bindServeViewMdoelWithTableView:tableView]) {
        _tableView = tableView ;
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        _tableView.rowHeight = BEEZoomW(40);;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self ;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4 ;
    }
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BEEMineCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[BEEMineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    @autoreleasepool {
        NSArray * titles = @[@"我的菜谱",@"我的好馆",@"我的草稿箱",@"我的收藏"];
        NSArray * images = @[@"icon_wodecaipu",@"icon_wodehaoguan",@"icon_wodecaogaoxiang",@"icon_wodeshoucang"];
        cell.iconImageView.image = [UIImage imageNamed:images[indexPath.row]];
        cell.tLabel.text = titles[indexPath.row];
    }
    if (indexPath.section == 1) {
        cell.iconImageView.image = [UIImage imageNamed:@"icon_联系我们"];
        cell.tLabel.text = @"联系我们";
    }
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, BEEW, 15)];
    line.backgroundColor = BEEdColor ;
    return line ;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01 ;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        [YBRoutes openURL:@"BEERouter://push/BEEMineContactUsController"];
        return ;
    }
    
    if (indexPath.row == 3) {
        [YBRoutes openURL:@"BEERouter://push/BEEMineCollectController"];
    }
    
    if (indexPath.row == 0) {
        [YBRoutes openURL:@"BEERouter://push/BEEMineDishesController"];
    }
    
    if (indexPath.row == 1) {
        [YBRoutes openURL:@"BEERouter://push/BEEMineShopsController"];
    }
    
    if (indexPath.row == 2) {
        [YBRoutes openURL:@"BEERouter://push/BEEMineDraftController"];
    }
}
@end
