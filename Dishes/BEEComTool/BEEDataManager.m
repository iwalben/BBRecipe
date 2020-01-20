//
//  BEEDataManager.m
//  Dishes
//
//  Created by Roddick on 2019/11/29.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEDataManager.h"
#import "BEEMineDishesShopsModel.h"


@implementation BEEDataManager
single_implementation(BEEDataManager)
+(void)loadDatas{}
+(void)initialize
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"BEEAllDatas" ofType:@"plist"];
    NSDictionary *totalData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    [BEEDataManager sharedBEEDataManager].dishesDatas = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:totalData[@"dishes"][@"data"]];
    [BEEDataManager sharedBEEDataManager].shopsDatas = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:totalData[@"shops"][@"data"]];
    [BEEDataManager sharedBEEDataManager].newestdishesDatas = [BEEMineDishesShopsModel mj_objectArrayWithKeyValuesArray:totalData[@"newestdishes"][@"data"]];
}

@end
