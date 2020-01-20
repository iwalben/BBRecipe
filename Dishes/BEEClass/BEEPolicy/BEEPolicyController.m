//
//  BEEPolicyController.m
//  Dishes
//
//  Created by Roddick on 2019/12/9.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEPolicyController.h"
#import <WebKit/WebKit.h>

@interface BEEPolicyController ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UIProgressView *progressView;
@end

@implementation BEEPolicyController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"隐私政策";
    self.view.backgroundColor = [UIColor whiteColor];
        
    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEH - BEENavigationBarHeight - BEESafeAreaBottomHeight-BEEZoomW(50))];
    [self.view addSubview:webView];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    
    _webView = webView;
    
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 2)];
    self.progressView.progressTintColor = GeColor;
    self.progressView.trackTintColor = [UIColor clearColor];
    [self.view addSubview:self.progressView];

    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)_url,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    self.url = encodedString;
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:_url]];
    [webView loadRequest:request];
    
    @weakify(self)
    [RACObserve(webView,estimatedProgress)subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        NSNumber *num = (NSNumber *)x;
        if(num.floatValue >= 1.0){
            [self.progressView setProgress:0];
        }else{
            [self.progressView setProgress:num.floatValue animated:YES];
        }
    }];
    
//    [RACObserve(webView, title) subscribeNext:^(id  _Nullable x) {
//        @strongify(self)
//        NSString * title = (NSString *)x;
//        title = title.length>18?[title substringToIndex:18]:title ;
//        self.title = title ;
//    }];
    
    
    UIButton * agreeBtn = [UIButton new];
    BEEViewRadius(agreeBtn, BEEZoomW(15));
    agreeBtn.backgroundColor = BEEpColor ;
    [agreeBtn setTitle:@"同意" forState:0];
    [agreeBtn setTitleColor:GaColor forState:0];
    [agreeBtn.titleLabel setFont:BEEBOLDSYSTEMFONT(15)];
    [self.view addSubview:agreeBtn];
    [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-BEEZoomW(10)-BEESafeAreaBottomHeight);
        make.left.mas_offset(BEEZoomW(30));
        make.width.mas_offset(BEEZoomW(120));
        make.height.mas_offset(BEEZoomW(30));
    }];
    
    [agreeBtn jk_addActionHandler:^(NSInteger tag) {
        @strongify(self)
        !self.agreementBlock?:self.agreementBlock();
    }];

    
    UIButton * noAgreeBtn = [UIButton new];
    BEEViewRadius(noAgreeBtn, BEEZoomW(15));
    noAgreeBtn.backgroundColor = BEEmColor ;
    [noAgreeBtn setTitle:@"不同意" forState:0];
    [noAgreeBtn setTitleColor:UIColor.grayColor forState:0];
    [noAgreeBtn.titleLabel setFont:BEEBOLDSYSTEMFONT(15)];
    [self.view addSubview:noAgreeBtn];
    [noAgreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-BEEZoomW(10)-BEESafeAreaBottomHeight);
        make.right.mas_offset(BEEZoomW(-30));
        make.width.mas_offset(BEEZoomW(120));
        make.height.mas_offset(BEEZoomW(30));
    }];
    
    [noAgreeBtn jk_addActionHandler:^(NSInteger tag) {
        @strongify(self)
        [LHLCVerifyAlertCustomView initWithTitle:@"温馨提示" subTitle:@"请同意隐私政策才能更好的体验我们的app!" complete:^{
        }];
        !self.noagreementBlock?:self.noagreementBlock();
    }];
    
    [[BEENetManager shareManager] monitorCurrentNetNotReachable:^(BEENetworkReachabilityStatus statue) {
        switch (statue) {
            case BEENetworkReachabilityStatusNotReachable:
                [YBProgressHUD showInfoMessage:@"当前网络已断开,请检查网络"];
                break;
            case BEENetworkReachabilityStatusReachableViaWWAN:
            case BEENetworkReachabilityStatusReachableViaWiFi:
            {
                //[YBProgressHUD showInfoMessage:@"当前网络已连接"];
                self.webView.URL ? [self.webView reload] : [self.webView loadRequest:[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.url]]] ;
            }
                break;
            default:
                break;
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {

}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{

}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{

}
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{

}

@end
