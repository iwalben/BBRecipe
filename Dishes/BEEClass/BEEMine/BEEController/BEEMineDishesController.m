//
//  BEEMineDishesController.m
//  Dishes
//
//  Created by Roddick on 2019/11/27.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineDishesController.h"
#import "BEEMineDishesView.h"

@interface BEEMineDishesController ()
@property (nonatomic ,strong) BEEMineDishesView * mineDishesView ;
@end

@implementation BEEMineDishesController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的菜谱";
    [self.view addSubview:self.mineDishesView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


-(BEEMineDishesView *)mineDishesView
{
    if (!_mineDishesView) {
        _mineDishesView = [[BEEMineDishesView alloc]initWithFrame:self.view.bounds];
    }
    return _mineDishesView ;
}



@end
