//
//  BEEBaseViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseViewModel.h"

@implementation BEEBaseViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BEEBaseViewModel *viewModel = [super allocWithZone:zone];
    if (viewModel) {
        [viewModel bee_initialize];
    }
    return viewModel;
}

- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)bee_initialize
{

}


- (instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView
{
    if (self == [super init]) {
    }
    return self ;
}

-(instancetype)bindServeViewModelWithCollectionView:(UICollectionView *)collectionView
{
    if (self == [super init]) {
    }
    return self; 
}

-(instancetype)bindViewModelWithTableView:(UITableView *)tableView
{
    if (self == [super init]) {
    }
    return self ;
}

-(instancetype)bindViewModelWithCollectionView:(UICollectionView *)collectionView
{
    if (self == [super init]) {
    }
    return self;
}

-(instancetype)bindServeViewModelWithCollectionView:(UICollectionView *)collectionView tableView:(UITableView *)tableView
{
    if (self == [super init]) {
    }
    return self;
}


@end
