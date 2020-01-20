//
//  BEEHomeViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeViewModel.h"

@interface BEEHomeViewModel()
@property (nonatomic ,strong) UITableView * tableView ;
@end

@implementation BEEHomeViewModel

-(instancetype)bindViewModelWithTableView:(UITableView *)tableView
{
    if (self == [super bindViewModelWithTableView:tableView]) {
        self.tableView = tableView ;
        @weakify(self)
        self.tableView.mj_header = [BEERefreshHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                @strongify(self)
                [self.tableView.mj_header endRefreshing];
            });
        }];
        
//        self.tableView.mj_footer = [BEERefreshFooter footerWithRefreshingBlock:^{
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                @strongify(self)
//                [self.tableView.mj_footer endRefreshing];
//            });
//        }];
    }
    return self;
}

@end
