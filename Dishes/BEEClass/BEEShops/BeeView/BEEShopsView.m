//
//  BEEShopsView.m
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEShopsView.h"
#import "BEEShopsViewModel.h"
#import "BEEShopsServeViewModel.h"

@interface BEEShopsView ()
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) LHLCHeadPageView * pageView;
@property (nonatomic ,assign) NSInteger index ;
@property (nonatomic ,strong) BEEShopsServeViewModel * serveViewModel;
@property (nonatomic ,strong) BEEShopsViewModel * viewModel;
@end

@implementation BEEShopsView

-(void)initAppearValue
{
    [self addSubview:self.pageView];
    self.viewModel = [[BEEShopsViewModel alloc]bindViewModelWithTableView:self.tableView];
    [self.serveViewModel = [BEEShopsServeViewModel alloc] bindServeViewMdoelWithTableView:self.tableView];
}


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, BEEZoomW(40), BEEW, BEEH-BEEZoomW(40)-BEETabbarBottomHeight - BEENavigationBarHeight) style:UITableViewStylePlain];
        [self addSubview:_tableView];
    }
    return _tableView ;
}

-(LHLCHeadPageView *)pageView{
    if (_pageView == nil) {
        NSArray *titles ;
        titles = @[@"全部",@"徐汇区",@"静安区",@"黄浦区",@"虹口区",@"浦东新区"];
        _pageView = [[LHLCHeadPageView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEZoomW(40)) items:titles];
        @weakify(self)
        _pageView.currentIndexBlock = ^(NSInteger index) {
            @strongify(self)
            [self.tableView.mj_header beginRefreshing];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                @strongify(self)
                if (index > 100) {
                    NSArray *array = [BEEDataManager sharedBEEDataManager].shopsDatas;
                    NSMutableSet *randomSet = [[NSMutableSet alloc] init];
                    int randomIndex = arc4random() % [array count] ;
                    randomIndex = randomIndex ?:1 ;
                    while ([randomSet count] < randomIndex) {
                         int r = arc4random() % [array count];
                         [randomSet addObject:[array objectAtIndex:r]];
                    }
                    self.serveViewModel.shopsDatas = [randomSet allObjects].copy ;
                }else{
                    self.serveViewModel.shopsDatas = [BEEDataManager sharedBEEDataManager].shopsDatas ;
                }
                [self.tableView reloadData];
            });
        };
    }
    return _pageView ;
}


@end
