//
//  BEEHomeController.m
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeController.h"
#import "BEEHomeView.h"
#import "BEEHomeViewModel.h"
#import "BEEHomeServeViewModel.h"

@interface BEEHomeController ()
@property (nonatomic ,strong) BEEHomeView * homeView;
@property (nonatomic ,strong) BEEHomeViewModel * viewModel;

@end

@implementation BEEHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.homeView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


-(BEEHomeView *)homeView
{
    if (!_homeView) {
        _homeView = [[BEEHomeView alloc]initWithFrame:self.view.bounds];
        @weakify(self)
        _homeView.currentIndexBlock = ^(NSInteger index) {
            @strongify(self);
            self.tabBarController.selectedIndex = 1 ;
        };
    }
    return _homeView ;
}

-(BEEHomeViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[BEEHomeViewModel alloc]init];
    }
    return _viewModel;
}


@end
