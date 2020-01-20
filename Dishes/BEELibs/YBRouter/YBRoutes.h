//
//  YBRoutes.h
//  AFNetworking
//
//  Created by apple on 2018/7/17.
//

#import "JLRoutes.h"

@interface YBRoutes : JLRoutes


/**
 open URL
 @param URL url字符串
 @return  打开URL
 */
+ (BOOL)openURL:(NSString *)URL;

+(void)registerLoginCompant:(id)params compleHandler:(void (^)(id object))completionHandler;
@end
