//
//  BEENetManager.h
//  Dishes
//
//  Created by Roddick on 2019/12/10.
//  Copyright © 2019 Roddick. All rights reserved.
//


#import <SystemConfiguration/SystemConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BEENetworkReachabilityStatus) {
    BEENetworkReachabilityStatusUnknown          = -1,
    BEENetworkReachabilityStatusNotReachable     = 0,
    BEENetworkReachabilityStatusReachableViaWWAN = 1,
    BEENetworkReachabilityStatusReachableViaWiFi = 2,
};

FOUNDATION_EXPORT NSString * const BEENetworkingReachabilityDidChangeNotification;
FOUNDATION_EXPORT NSString * const BEENetworkingReachabilityNotificationStatusItem;
FOUNDATION_EXPORT NSString * BEEStringFromNetworkReachabilityStatus(BEENetworkReachabilityStatus status);

typedef void(^networkReachabilityStatusBlock)(BEENetworkReachabilityStatus statue);

@interface BEENetManager : NSObject
+ (instancetype)shareManager;
- (void)monitorCurrentNetNotReachable:(networkReachabilityStatusBlock)reachabilityStatusBlock;
@end

@interface BEENetworkReachabilityManager : NSObject
@property (readonly, nonatomic, assign) BEENetworkReachabilityStatus networkReachabilityStatus;
@property (readonly, nonatomic, assign, getter = isReachable) BOOL reachable;
@property (readonly, nonatomic, assign, getter = isReachableViaWWAN) BOOL reachableViaWWAN;
@property (readonly, nonatomic, assign, getter = isReachableViaWiFi) BOOL reachableViaWiFi;
+ (instancetype)sharedManager;
+ (instancetype)manager;
+ (instancetype)managerForDomain:(NSString *)domain;
+ (instancetype)managerForAddress:(const void *)address;
- (instancetype)initWithReachability:(SCNetworkReachabilityRef)reachability NS_DESIGNATED_INITIALIZER;
- (void)startMonitoring;
- (void)stopMonitoring;
- (NSString *)localizedNetworkReachabilityStatusString;
- (void)setReachabilityStatusChangeBlock:(nullable void (^)(BEENetworkReachabilityStatus status))block;
@end



@interface BEENetworkTool : NSObject

+ (instancetype)shareInstance;

//请求URL
@property (nonatomic, copy) NSString *requestURL;


typedef void(^HSResponseSuccessBlock)(NSDictionary *responseObject);

typedef void(^HSResponseFailBlock)(NSError *error);

/**
 * @brief   GET请求方法
 
 * @param relativePath 接口名称
 * @param params 请求参数
 * @param successBlock 请求成功回调
 * @param failBlock 请求失败回调
 */
- (void)requestGET:(NSString *)relativePath params:(NSDictionary *)params successBlock:(HSResponseSuccessBlock)successBlock failBlock:(HSResponseFailBlock)failBlock;

/**
 * @brief   POST请求方法
 
 * @param relativePath 接口名称
 * @param params 请求参数
 * @param successBlock 请求成功回调
 * @param failBlock 请求失败回调
 */
- (void)requestPOST:(NSString *)relativePath params:(NSDictionary *)params successBlock:(HSResponseSuccessBlock)successBlock failBlock:(HSResponseFailBlock)failBlock;

/**
 * @brief   JSON格式网络接口请求方法
 *
 * @param relativePath 接口名称
 * @param params 请求参数
 * @param successBlock 请求成功回调
 * @param failBlock 请求失败回调
 */
- (void)requestJsonPost:(NSString *)relativePath params:(NSDictionary *)params successBlock:(HSResponseSuccessBlock)successBlock failBlock:(HSResponseFailBlock)failBlock;

@end

NS_ASSUME_NONNULL_END
