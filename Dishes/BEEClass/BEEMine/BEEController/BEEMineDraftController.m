//
//  BEEMineDraftController.m
//  Dishes
//
//  Created by Roddick on 2019/11/28.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineDraftController.h"
#import "BEEMineDraftView.h"

@interface BEEMineDraftController ()
@property (nonatomic ,strong) BEEMineDraftView * draftView ;
@end

@implementation BEEMineDraftController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的草稿箱";
    [self.view addSubview:self.draftView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


-(BEEMineDraftView *)draftView
{
    if (!_draftView) {
        _draftView = [[BEEMineDraftView alloc]initWithFrame:self.view.bounds];
    }
    return _draftView ;
}

@end
