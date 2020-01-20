//
//  BEEHomeShopsDetailServeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/26.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeShopsDetailServeViewModel.h"
#import "BEEHSectionView.h"
#import "BEEHomeDiesDetailView.h"
#import "BEEHomeStyleCell.h"
#import "BEEHomeHorizontalCell.h"


static NSString * reuseID = @"BEEHomeShopsDetailServeViewModelID";
static NSString * BEEHomeHorizontalCellReuseID = @"BEEHomeHorizontalCellID";
static NSString * BEEHomeShopsDetailStyleCellReuseID = @"BEEHomeStyleCellReuseID";

@interface BEEHomeShopsDetailServeViewModel ()
@property (nonatomic ,strong) UITableView * tableView ;
@property (nonatomic ,strong) NSArray * recommendDatas ;
@property (nonatomic) NSArray * shopsDatas ;
@end

@implementation BEEHomeShopsDetailServeViewModel

-(instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView
{
    if (self == [super bindServeViewMdoelWithTableView:tableView]) {
        self.shopsDatas = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:[BEEHelpTool arrayWithJson:@"BEEDatasOtherShops"]];
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
        [tableView registerClass:[BEEHomeHorizontalCellShopsDetailCell class] forCellReuseIdentifier:BEEHomeHorizontalCellReuseID];
        [tableView registerClass:[BEEHomeStyleCell class] forCellReuseIdentifier:BEEHomeShopsDetailStyleCellReuseID];
    }
    return self ;
}

-(void)setModel:(BEEHomeDetailModel *)model
{
    _model = model ;
    self.recommendDatas = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:self.model.recommenddishes[@"data"]];
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
    NSArray * titles = @[@"推荐理由：",@"推荐必点菜：",@"其他好馆："];
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
        case 1 :
            return 1 ;
            break;
        case 2 :
           return self.shopsDatas.count;
        default:
            return 0;
            break;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3 ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            BEEHomeDiesDetailStyleCellA * cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
            if (!cell) {
                cell = [[BEEHomeDiesDetailStyleCellA alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
            }
            cell.tLabel.text = self.model.reason ;
            return cell;
        }
            break;
        case 1:
        {
            BEEHomeHorizontalCellShopsDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:BEEHomeHorizontalCellReuseID];
            if (!cell) {
                cell = [[BEEHomeHorizontalCellShopsDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BEEHomeHorizontalCellReuseID];
            }
            cell.newestDatas = self.recommendDatas ;
            return cell;
        }
            break;
        case 2:
        {
            BEEHomeStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:BEEHomeShopsDetailStyleCellReuseID];
            cell.model = self.shopsDatas[indexPath.row];
            if (!cell) {
                cell = [[BEEHomeStyleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BEEHomeShopsDetailStyleCellReuseID];
            }
            return cell;
        }
            break;
        default:
            return [UITableViewCell new];
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return UITableViewAutomaticDimension ;
    }
    
    if (indexPath.section == 1) {
        return BEEZoomW(172) ;
    }
    return BEEZoomW(130);
}
@end
