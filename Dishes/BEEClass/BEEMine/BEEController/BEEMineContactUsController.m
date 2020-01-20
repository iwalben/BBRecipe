//
//  BEEMineContactUsController.m
//  Dishes
//
//  Created by Roddick on 2019/11/28.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineContactUsController.h"
#import "BEEMIneContaceUsView.h"
#import "LHLCBaseKeyboardAvoidingScrollView.h"

@interface BEEMineContactUsController ()
@property (nonatomic ,strong)BEEMIneContaceUsView * contaceUsView;
@end

@implementation BEEMineContactUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联系我们";
    [self.view addSubview:self.contaceUsView];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(BEEMIneContaceUsView *)contaceUsView
{
    if (!_contaceUsView) {
        _contaceUsView = [[BEEMIneContaceUsView alloc]initWithFrame:self.view.bounds];
    }
    return _contaceUsView ;
}


@end
