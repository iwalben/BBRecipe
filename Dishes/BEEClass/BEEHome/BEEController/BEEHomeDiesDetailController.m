//
//  BEEHomeDiesDetailController.m
//  Dishes
//
//  Created by Roddick on 2019/11/26.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeDiesDetailController.h"
#import "BEEHomeDiesDetailView.h"

@interface BEEHomeDiesDetailController ()
@property (nonatomic ,strong) BEEHomeDiesDetailView * detailView;
@end

@implementation BEEHomeDiesDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.detailDic[@"title1"];
    [self.view addSubview:self.detailView];
    self.detailView.detailDic = self.detailDic ;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(BEEHomeDiesDetailView *)detailView
{
    if (!_detailView) {
        CGRect rect = CGRectMake(0, 0, BEEW, BEEH - BEENavigationBarHeight);
        _detailView = [[BEEHomeDiesDetailView alloc]initWithFrame:rect];
    }
    return _detailView ;
}

@end
