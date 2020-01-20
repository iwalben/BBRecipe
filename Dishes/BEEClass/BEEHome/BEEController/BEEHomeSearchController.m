//
//  BEEHomeSearchController.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeSearchController.h"
#import "BEEHomeSearchView.h"

@interface BEEHomeSearchController ()
@property (nonatomic ,strong) BEEHomeSearchView * searchView;
@end

@implementation BEEHomeSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.searchView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(BEEHomeSearchView *)searchView
{
    if (!_searchView) {
        _searchView = [[BEEHomeSearchView alloc]init];
        _searchView.frame = self.view.bounds;
    }
    return _searchView ;
}


@end
