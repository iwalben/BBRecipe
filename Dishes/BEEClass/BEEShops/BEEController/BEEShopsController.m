//
//  BEEShopsController.m
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEShopsController.h"
#import "BEEShopsView.h"

@interface BEEShopsController ()
@property (nonatomic , strong) BEEShopsView * shopsView;
@end

@implementation BEEShopsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"好馆";
     [self.view addSubview:self.shopsView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(BEEShopsView *)shopsView
{
    if (!_shopsView) {
        _shopsView = [[BEEShopsView alloc]initWithFrame:self.view.bounds];
    }
    return _shopsView ;
}



@end
