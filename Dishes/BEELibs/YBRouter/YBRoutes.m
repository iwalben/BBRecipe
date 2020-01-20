//
//  YBRoutes.m
//  AFNetworking
//
//  Created by apple on 2018/7/17.
//

#import "YBRoutes.h"
#import "YBRouteConstant.h"
#import "MJLoginViewController.h"

@implementation YBRoutes
+ (BOOL)openURL:(NSString *)URL{
    NSURL *myUrl = [NSURL URLWithString:URL];
    if ([myUrl.scheme isEqualToString:@"https"]) {
        URL = [@"BEEHttps:" stringByAppendingString:myUrl.resourceSpecifier];
    }else if ([myUrl.scheme isEqualToString:@"http"]){
        URL = [@"BEEHttp:" stringByAppendingString:myUrl.resourceSpecifier];
    }
    return  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
}


+(void)registerLoginCompant:(id)params compleHandler:(void (^)(id object))completionHandler
{
    id handlerBlock = [JLRRouteHandler handlerBlockForTargetClass:[MJLoginViewController class] completion:^BOOL (MJLoginViewController *viewController) {
        UINavigationController *navigationVC = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
        viewController.modalPresentationStyle = UIModalPresentationFullScreen ;
        viewController.loginBlock = ^(BOOL success, NSString *error) {
            completionHandler(@(success));
        };
        [navigationVC presentViewController:viewController animated:YES completion:nil];
        return YES;
    }];
    [[JLRoutes globalRoutes] addRoute:@"/login/:" handler:handlerBlock];
}
@end
