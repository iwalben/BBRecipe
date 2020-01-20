//
//  BEEBaseViewModelProtocol.h
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UITableView;
@class UICollectionView;
@protocol BEEBaseViewModelProtocol <NSObject>

@optional
- (void)bee_initialize;
- (instancetype)initWithModel:(id)model;
-(instancetype)bindServeViewMdoelWithTableView:(UITableView *)tableView;
-(instancetype)bindServeViewModelWithCollectionView:(UICollectionView *)collectionView;
-(instancetype)bindServeViewModelWithCollectionView:(UICollectionView *)collectionView tableView:(UITableView *)tableView;
-(instancetype)bindViewModelWithTableView:(UITableView *)tableView;
-(instancetype)bindViewModelWithCollectionView:(UICollectionView *)collectionView;
@end
