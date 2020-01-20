//
//  BEEHomeShopsDetailController.m
//  Dishes
//
//  Created by Roddick on 2019/11/26.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeShopsDetailController.h"
#import "BEEHomeShopsDetailView.h"

@interface BEEHomeShopsDetailController ()
@property (nonatomic ,strong) BEEHomeShopsDetailView * detailView;
@end

@implementation BEEHomeShopsDetailController

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


-(BEEHomeShopsDetailView *)detailView
{
    if (!_detailView) {
        CGRect rect = CGRectMake(0, 0, BEEW, BEEH - BEENavigationBarHeight);
        _detailView = [[BEEHomeShopsDetailView alloc]initWithFrame:rect];
    }
    return _detailView ;
}

@end
