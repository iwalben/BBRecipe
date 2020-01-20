//
//  BEEMineDishesShopsModel.h
//  Dishes
//
//  Created by Roddick on 2019/11/28.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BEEMineDishesShopsModel : NSObject
@property (nonatomic ,copy) NSString * imageName ;
@property (nonatomic ,copy) NSString * title0 ;
@property (nonatomic ,copy) NSString * title1 ;
@property (nonatomic ,copy) NSString * title2 ;
@property (nonatomic ,copy) NSString * title3 ;
@property (nonatomic ,assign) BOOL isSelected ;
@property (nonatomic ,copy) NSDictionary * detail ;

+(NSString *)jsonStringWithNSDictionary:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
