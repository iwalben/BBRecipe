//
//  BEERefreshHeader.m
//  Dishes
//
//  Created by Roddick on 2019/11/22.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEERefreshHeader.h"

@implementation BEERefreshHeader
+ (instancetype)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock{
   BEERefreshHeader *header =  [super headerWithRefreshingBlock:refreshingBlock];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.text = @"刷新中...";
    [header setTitle:@"刷新中..." forState:MJRefreshStateRefreshing];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    header.automaticallyChangeAlpha = YES;
    return header;
}
@end


@implementation BEERefreshFooter
+ (instancetype)footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock{
    BEERefreshFooter *footer =  [super footerWithRefreshingBlock:refreshingBlock];
    [footer setTitle:@"上拉刷新" forState:MJRefreshStateIdle];
    [footer setTitle:@"刷新中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"- 到底了 -" forState:MJRefreshStateNoMoreData];
    return footer;
}
@end
