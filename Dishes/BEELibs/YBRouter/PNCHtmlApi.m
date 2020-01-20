//
//  PNCHtmlApi.m
//  apple
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 Sameway. All rights reserved.
//

#import "PNCHtmlApi.h"
#import "YBWebViewController.h"
#import "YBRoutes.h"
#import "WKWebViewJavascriptBridge.h"

@interface PNCHtmlApi()
{
    WKWebViewJavascriptBridge *bridge;
}
@property (nonatomic ,strong) WKWebView *webView;

@end

@implementation PNCHtmlApi

- (instancetype)initWithWebView:(WKWebView *)webView{
    if (self = [super init]) {
        _webView = webView;
        bridge = [WKWebViewJavascriptBridge bridgeForWebView:webView];
        [self registerApi];
    }
    return self;
}

- (void)registerApi{
//    //分享
//    [self p_shareApi];
//    //打开h5
//    [self p_openWebView];
//    //获取用户基本信息
//    [self p_fetchUserId];
//    //检查用户是否登录
//    [self p_checkLogin];
//    //图片分享
//    [self p_shareWXPhotoApi];
}



@end
