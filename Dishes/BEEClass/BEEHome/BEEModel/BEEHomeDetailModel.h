//
//  BEEHomeDetailModel.h
//  Dishes
//
//  Created by Roddick on 2019/11/29.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BEEHomeDetailModel : NSObject
@property (nonatomic ,copy) NSString * imageName ;
@property (nonatomic ,copy) NSString * title0 ;
@property (nonatomic ,copy) NSString * title1 ;
@property (nonatomic ,copy) NSString * title2 ;
@property (nonatomic ,copy) NSString * title3 ;
@property (nonatomic ,copy) NSString * like ;
@property (nonatomic ,copy) NSArray * material ;
@property (nonatomic ,copy) NSString * xinde ;
@property (nonatomic ,copy) NSString * steps ;


@property (nonatomic ,copy) NSString * reason ;

@property (nonatomic ,copy) NSDictionary * recommenddishes ;

@end

NS_ASSUME_NONNULL_END
