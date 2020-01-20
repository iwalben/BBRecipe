//
//  BEEIssueDishesController.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEIssueDishesController.h"
#import "BEEIssueDishesView.h"

@interface BEEIssueDishesController ()
@property (nonatomic ,strong)BEEIssueDishesView * issueDishesView;
@end

@implementation BEEIssueDishesController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"上传菜谱";
    [self.view addSubview:self.issueDishesView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(BEEIssueDishesView *)issueDishesView
{
    if (!_issueDishesView) {
        _issueDishesView = [[BEEIssueDishesView alloc]initWithFrame:self.view.bounds];
    }
    return _issueDishesView ;
}


@end
