//
//  BEEHomeDiesDetailServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/26.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeDiesDetailServeViewModel.h"
#import "BEEHSectionView.h"
#import "BEEHomeDiesDetailView.h"
#import "BEEHomeStyleCell.h"

static NSString * reuseID = @"BEEHomeDiesDetailStyleCellAID";
static NSString * reuseBID = @"BEEHomeDiesDetailStyleCellBID";
static NSString * BEEHomeDetailStyleCellReuseID = @"BEEHomeStyleCellReuseID";

@interface BEEHomeDiesDetailServeViewModel ()
@property (nonatomic ,strong) UITableView * tableView ;
@property (nonatomic) NSArray * dishesDatas ;
@end

@implementation BEEHomeDiesDetailServeViewModel



-(instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView
{
    if (self == [super bindServeViewMdoelWithTableView:tableView]) {
        self.dishesDatas = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:[BEEHelpTool arrayWithJson:@"BEEDatasOtherDishes"]];
        self.tableView = tableView ;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
        tableView.backgroundColor = GaColor;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 157;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        [tableView registerClass:[BEEHomeDiesDetailStyleCellA class] forCellReuseIdentifier:reuseID];
        [tableView registerClass:[BEEHomeDiesDetailStyleCellB class] forCellReuseIdentifier:reuseBID];
        [tableView registerClass:[BEEHomeStyleCell class] forCellReuseIdentifier:BEEHomeDetailStyleCellReuseID];
    }
    return self ;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return BEEZoomW(40) ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSArray * titles = @[@"烧菜心得：",@"食材用料：",@"做法步骤：",@"其他菜谱："];
    BEEHSectionView * sectionV = [[BEEHSectionView alloc]initWithTitle:titles[section]];
    sectionV.frame =CGRectMake(0, 0, BEEW, BEEZoomW(40));
    sectionV.backgroundColor = UIColor.whiteColor ;
    return sectionV;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
        case 2:
            return 1 ;
            break;
        case 1 :
            return self.model.material.count;
        case 3 :
           return self.dishesDatas.count;
        default:
            return 0;
            break;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4 ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        case 2:
        {
            BEEHomeDiesDetailStyleCellA * cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
            if (!cell) {
                cell = [[BEEHomeDiesDetailStyleCellA alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
            }
            cell.tLabel.text = indexPath.section == 2 ? self.model.steps:self.model.xinde ;
            return cell;
        }
            break;
        case 1:
        {
            BEEHomeDiesDetailStyleCellB * cell = [tableView dequeueReusableCellWithIdentifier:reuseBID];
            if (!cell) {
                cell = [[BEEHomeDiesDetailStyleCellB alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseBID];
            }
            cell.tLabel.text = [self.model.material[indexPath.row] allKeys][0];
            cell.sLabel.text = [self.model.material[indexPath.row] allValues][0];;
            return cell;
        }
            break;
        default:
        {
            BEEHomeStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:BEEHomeDetailStyleCellReuseID];
            if (!cell) {
                cell = [[BEEHomeStyleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BEEHomeDetailStyleCellReuseID];
            }
            cell.model = self.dishesDatas[indexPath.row];
            return cell;
        }
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section < 3) {
        if (indexPath.section == 1) {
            return BEEZoomW(30);
        }
        return UITableViewAutomaticDimension ;
    }
    return BEEZoomW(130);
}


@end
