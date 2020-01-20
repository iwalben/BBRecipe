//
//  BEEMineController.m
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineController.h"
#import "BEEMineView.h"
#import "MJLoginViewController.h"

@interface BEEMineController ()
@property (nonatomic ,strong) BEEMineView * mineView ;
@end

@implementation BEEMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mineView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(BEEMineView *)mineView
{
    if (!_mineView) {
        _mineView = [[BEEMineView alloc]initWithFrame:self.view.bounds];
    }
    return _mineView ;
}

@end
