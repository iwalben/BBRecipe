//
//  BEEMineConllectView.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineConllectView.h"
#import "BEEMineCollectServeViewModel.h"

@interface BEEMineConllectView ()
@property (nonatomic ,strong) UITableView * tableView ;
@property (nonatomic ,strong) BEEMineCollectServeViewModel * serveViewModel ;
@end

@implementation BEEMineConllectView

-(void)initAppearValue
{
    self.serveViewModel = [[BEEMineCollectServeViewModel alloc] bindServeViewMdoelWithTableView:self.tableView];
}


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        [self addSubview:_tableView];
    }
    return _tableView ;
}
@end
