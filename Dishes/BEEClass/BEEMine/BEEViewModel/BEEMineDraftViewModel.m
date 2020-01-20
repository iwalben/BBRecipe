//
//  BEEMineDraftViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/28.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineDraftViewModel.h"

@interface BEEMineDraftViewModel ()
@property (nonatomic ,strong) UITableView * tableView ;
@end


@implementation BEEMineDraftViewModel
-(instancetype)bindViewModelWithTableView:(UITableView *)tableView
{
    if (self == [super bindViewModelWithTableView:tableView]) {
        self.tableView = tableView ;
        @weakify(self)
        self.tableView.mj_header = [BEERefreshHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                @strongify(self)
                [self.tableView.mj_header endRefreshing];
            });
        }];
    }
    return self;
}
@end
