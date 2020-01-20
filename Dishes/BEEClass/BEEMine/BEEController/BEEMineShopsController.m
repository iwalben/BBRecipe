//
//  BEEMineShopsController.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineShopsController.h"
#import "BEEMineShopsView.h"

@interface BEEMineShopsController ()
@property (nonatomic ,strong) BEEMineShopsView * mineShopsView ;
@end

@implementation BEEMineShopsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的好馆";
    [self.view addSubview:self.mineShopsView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


-(BEEMineShopsView *)mineShopsView
{
    if (!_mineShopsView) {
        _mineShopsView = [[BEEMineShopsView alloc]initWithFrame:self.view.bounds];
    }
    return _mineShopsView ;
}



@end
