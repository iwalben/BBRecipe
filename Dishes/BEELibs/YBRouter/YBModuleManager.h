//
//  YBModuleManager.h
//  AFNetworking
//
//  Created by apple on 2018/8/1.
//

#import <Foundation/Foundation.h>

@interface YBModuleManager : NSObject

+ (void)registerAppdelegateModule:(Class)moduleClass;
+ (void)hookAppDelegate:(id<UIApplicationDelegate>)delegate;
@end
