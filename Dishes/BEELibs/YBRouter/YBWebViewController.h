//
//  YBWebViewController.h
//  youonBikePlanA
//
//  Created by apple on 2018/1/26.
//  Copyright © 2018年 audi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

typedef void(^WebViewReceiveScriptMessageBlock)(WKScriptMessage *message,NSError *error);

@interface YBWebViewController : UIViewController
@property (nonatomic , assign) BOOL isFromFeedbackPage;
- (instancetype)initWithURL:(NSString *)URL;

@end

@interface WeakScriptMessageHandler : NSObject <WKScriptMessageHandler>
@property (nonatomic,strong) NSMutableDictionary *handlers;
//单利方法
+ (instancetype)shareInstance;
//与后台交互 只需要调用这个函数
+ (void)addName:(NSString *)name receiveMessage:(WebViewReceiveScriptMessageBlock)block;

@end
