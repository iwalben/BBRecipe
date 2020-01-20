//
//  UIApplication+hook.m
//  AFNetworking
//
//  Created by apple on 2018/8/1.
//

#import "UIApplication+hook.h"
#import "YBModuleManager.h"

@implementation UIApplication (hook)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.class jk_swizzleMethod:@selector(setDelegate:) withMethod:@selector(hook_setDelegate:)];
    });
}

- (void)hook_setDelegate:(id<UIApplicationDelegate>)delegate{
    [self hook_setDelegate:delegate];
    [YBModuleManager hookAppDelegate:delegate];
}

@end
