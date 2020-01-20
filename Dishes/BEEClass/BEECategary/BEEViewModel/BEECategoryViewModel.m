//
//  BEECategoryViewModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEECategoryViewModel.h"

@interface BEECategoryViewModel ()
@property (nonatomic , strong) UICollectionView * collectionView;
@end

@implementation BEECategoryViewModel

-(instancetype)bindViewModelWithCollectionView:(UICollectionView *)collectionView
{
    if (self == [super bindViewModelWithCollectionView:collectionView]) {
        self.collectionView = collectionView;
        @weakify(self)
        self.collectionView.mj_header = [BEERefreshHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                @strongify(self)
                [self.collectionView.mj_header endRefreshing];
            });
        }];
        
//        self.collectionView.mj_footer = [BEERefreshFooter footerWithRefreshingBlock:^{
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                @strongify(self)
//                [self.collectionView.mj_footer endRefreshing];
//            });
//        }];
        
    }
    return self ;
}

@end
