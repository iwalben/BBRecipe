//
//  BEEMineCollectController.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineCollectController.h"
#import "BEEMineConllectView.h"

@interface BEEMineCollectController ()
@property (nonatomic ,strong) BEEMineConllectView * mineCollectView ;
@end

@implementation BEEMineCollectController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    [self.view addSubview:self.mineCollectView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


-(BEEMineConllectView *)mineCollectView
{
    if (!_mineCollectView) {
        CGRect rect = CGRectMake(0, 0, BEEW, BEEH - BEENavigationBarHeight);
        _mineCollectView = [[BEEMineConllectView alloc]initWithFrame:rect];
    }
    return _mineCollectView ;
}

@end
