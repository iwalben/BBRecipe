//
//  YBRouteRegister.m
//  AFNetworking
//
//  Created by apple on 2018/7/17.
//

#import "YBRouteRegister.h"
#import "YBRoutes.h"
#import "YBRouteConstant.h"
#import "YBWebViewController.h"
#import "UIViewController+YBViewController.h"
#import "YBModuleManager.h"

@implementation YBRouteRegister

//每个路由注册类都要实现这个函数
+ (void)load{
    [YBModuleManager registerAppdelegateModule:self.class];
}

+ (void)enroll:(NSArray<__kindof NSString*>*)modules{
    NSMutableArray *allModules = [NSMutableArray array];
    [allModules addObject:@"YBRouteRegister"];
    [allModules addObjectsFromArray:modules];
    for (int i = 0; i < allModules.count; i++) {
        Class cls = NSClassFromString(allModules[i]);
        id r = [cls new];
        if ([r conformsToProtocol:@protocol(YBRouteRegisterProtocol)]) {
            [r enroll];
        }
    }
}

- (void)enroll {
    //主route
    [YBRoutes.globalRoutes addRoute:@"/push/:controller/:detail" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return [self push:parameters];
    }];
    
    [YBRoutes.globalRoutes addRoute:@"/push/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return [self push:parameters];
    }];
    
    [YBRoutes.globalRoutes addRoute:@"/present/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return [self present:parameters];
    }];

    [YBRoutes.globalRoutes addRoute:@"/html/:fileName" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        NSString *fileName = parameters[@"fileName"];
        if(!fileName || fileName.length == 0){
            return NO;
        }
        NSString *filePath = [NSBundle.mainBundle pathForResource:fileName ofType:@"html"];
        NSURL *URL = [NSURL fileURLWithPath:filePath];
        NSString *url = URL.absoluteString;
        [self pushToWebViewWithUrlStr:url];
        return YES;
    }];
    
    YBRoutes.globalRoutes.unmatchedURLHandler = ^(JLRoutes * _Nonnull routes, NSURL * _Nullable URL, NSDictionary<NSString *,id> * _Nullable parameters) {
        NSString *urlStr;
        if([URL.scheme isEqualToString:BEEHttpRouteSchema]){
           urlStr = [@"http:"stringByAppendingString:URL.resourceSpecifier];
        }
        else if([URL.scheme isEqualToString:BEEHttpsRouteSchema]){
           urlStr = [@"https:"stringByAppendingString:URL.resourceSpecifier];
        }
        else{
            urlStr = URL.absoluteString;
        }
        [self pushToWebViewWithUrlStr:urlStr];
    };
    
    
    //add
    [YBRoutes.globalRoutes addRoute:@"/pop/:" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return [self pop:parameters];
    }];
}

- (BOOL)push:(NSDictionary <NSString *,id> *)parameters{
    Class cls = NSClassFromString(parameters[@"controller"]);
    if (!cls) {
        return NO;
    }
    BEEBaseViewController *vc = [cls new];
    vc.routeArguments = parameters;
    if (parameters[@"detail"]) {
        vc.detailDic = [self dictionaryWithJsonString:parameters[@"detail"]];
    }
    [[UIViewController topViewController].navigationController pushViewController:vc animated:YES];
    return YES;
}

 - (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
 {
     if (jsonString == nil) {
         return nil;
     }
     NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
     NSError *err;
     NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
     if(err) {
         NSLog(@"json解析失败：%@",err);
         return nil;
     }
     return dic;
 }
 


- (BOOL)present:(NSDictionary <NSString *,id> *)parameters{
    Class cls = NSClassFromString(parameters[@"controller"]);
    if (!cls) {
        return NO;
    }
    UIViewController *vc = [cls new];
    vc.routeArguments = parameters;
    vc.modalPresentationStyle = UIModalPresentationFullScreen ;
    [[UIViewController topViewController] presentViewController:vc animated:YES completion:nil];
    return YES;
}

- (BOOL)present:(NSDictionary <NSString *,id> *)parameters handler:(void (^)(id params))handlerBlock{
    Class cls = NSClassFromString(parameters[@"controller"]);
    if (!cls) {
        return NO;
    }
    BEEBaseViewController *vc = [cls new];
    vc.handlerBlock = handlerBlock ;
    vc.routeArguments = parameters;
    vc.modalPresentationStyle = UIModalPresentationFullScreen ;
    [[UIViewController topViewController] presentViewController:vc animated:YES completion:nil];
    return YES;
}


- (BOOL)pop:(NSDictionary <NSString *,id> *)parameters{
    [[UIViewController topViewController].navigationController popViewControllerAnimated:YES];
    return YES;
}

- (void)pushToWebViewWithUrlStr:(NSString *)urlStr{
    YBWebViewController *vc = [[YBWebViewController alloc]initWithURL:urlStr];
    [[UINavigationController topViewController].navigationController pushViewController:vc animated:YES];
}

+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    if ([url.scheme isEqualToString:BEEDefaultRouteSchema]
        || [url.scheme isEqualToString:BEEHttpRouteSchema]
        || [url.scheme isEqualToString:BEEHttpsRouteSchema]) {
        [YBRoutes.globalRoutes routeURL:url];
    }
    return YES;
}

@end
