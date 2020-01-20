//
//  YBRouteRegister.h
//  AFNetworking
//
//  Created by apple on 2018/7/17.
//

#import <Foundation/Foundation.h>
//每个组件都需要实现类似YBRouteRegister的组件注册类
@protocol YBRouteRegisterProtocol

@required
- (void)enroll;
+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@end

@interface YBRouteRegister : NSObject <YBRouteRegisterProtocol>


/**
 注册业务路由

 @param modules  需要注册的组件名称
 @para
 */
+ (void)enroll:(NSArray<__kindof NSString*>*)modules;


@end

