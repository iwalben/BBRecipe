//
//  BEEIssueController.m
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEIssueController.h"
#import "BEEIssueView.h"

@interface BEEIssueController ()
@property (nonatomic ,strong)BEEIssueView * issueView;
@end

@implementation BEEIssueController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布好馆";
    [self.view addSubview:self.issueView];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(BEEIssueView *)issueView
{
    if (!_issueView) {
        _issueView = [[BEEIssueView alloc]initWithFrame:self.view.bounds];
    }
    return _issueView ;
}


@end
