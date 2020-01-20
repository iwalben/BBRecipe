//
//  YBModuleManager.m
//  AFNetworking
//
//  Created by apple on 2018/8/1.
//

#import "YBModuleManager.h"


static NSMutableArray <Class> *moduleClasses;
@implementation YBModuleManager

+ (void)registerAppdelegateModule:(Class)moduleClass{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moduleClasses = [NSMutableArray array];
    });
    if(![moduleClasses containsObject:moduleClass]){
        [moduleClasses addObject:moduleClass];
    }
}

+ (void)hookAppDelegate:(id<UIApplicationDelegate>)delegate{
    Class delegateClass = [delegate class];
    if(!delegateClass){
        return;
    }
    hook_exchangeMethod(delegateClass, @selector(application:openURL:sourceApplication:annotation:), self.class, @selector(hook_application:openURL:sourceApplication:annotation:));
}


static void hook_exchangeMethod(Class originalClass, SEL originalSel, Class replacedClass, SEL replacedSel){
    Method originalMethod = class_getInstanceMethod(originalClass, originalSel);
    Method replacedMethod = class_getInstanceMethod(replacedClass, replacedSel);
    IMP replacedMethodIMP = method_getImplementation(replacedMethod);
    BOOL didAddMethod =
    class_addMethod(originalClass,
                    replacedSel,
                    replacedMethodIMP,
                    method_getTypeEncoding(replacedMethod));
    if (didAddMethod) {
        Method newMethod = class_getInstanceMethod(originalClass, replacedSel);
        method_exchangeImplementations(originalMethod, newMethod);
    }else{
        method_exchangeImplementations(originalMethod, replacedMethod);
    }
}


- (BOOL)hook_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    void (*lhlc_msgSend)(id,SEL,UIApplication *,NSURL *,NSString *,id) = (void *)objc_msgSend;
    for (Class moduleClass in moduleClasses) {
        BOOL ret = [moduleClass respondsToSelector:_cmd];
        if (!ret){
            continue;
        }
        lhlc_msgSend(moduleClass,_cmd,application,url,sourceApplication,application);
    }
    return [self hook_application:application openURL:url sourceApplication:sourceApplication annotation:application];
}



@end
