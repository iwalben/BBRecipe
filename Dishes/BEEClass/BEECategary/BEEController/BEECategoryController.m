//
//  BEECategoryController.m
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEECategoryController.h"
#import "BEECategoryView.h"

@interface BEECategoryController ()
@property (nonatomic ,strong) BEECategoryView * categoryView;
@end

@implementation BEECategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分类";
    [self.view addSubview:self.categoryView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


-(BEECategoryView *)categoryView
{
    if (!_categoryView) {
        _categoryView = [[BEECategoryView alloc]initWithFrame:self.view.bounds];
    }
    return _categoryView ;
}


@end
