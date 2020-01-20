//
//  BEEDataManager.h
//  Dishes
//
//  Created by Roddick on 2019/11/29.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BEEDataManager : NSObject
+ (instancetype)sharedBEEDataManager;
+(void)loadDatas;
@property (nonatomic ,copy) NSArray * shopsDatas;
@property (nonatomic ,copy) NSArray * dishesDatas;
@property (nonatomic ,copy) NSArray * newestdishesDatas;
@end

NS_ASSUME_NONNULL_END
