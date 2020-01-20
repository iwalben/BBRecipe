//
//  YBWebViewController.m
//  youonBikePlanA
//
//  Created by apple on 2018/1/26.
//  Copyright © 2018年 audi. All rights reserved.
//

#import "YBWebViewController.h"
#import <WebKit/WebKit.h>
#import "PNCHtmlApi.h"

@interface YBWebViewController ()<WKUIDelegate,WKNavigationDelegate>
{
    NSString *_url;
    BOOL _tag;
}

@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic,strong) UIBarButtonItem *closeItem;
@property (nonatomic,strong) UIBarButtonItem *backItem;
@property (nonatomic ,strong) PNCHtmlApi *htmlApi;
@end

@implementation YBWebViewController


- (instancetype)initWithURL:(NSString *)URL{
    if (self = [super init]) {
        _url = URL;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //[SVProgressHUD dismiss];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEH - BEENavigationBarHeight)];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    _webView = webView;
    [_webView addObserver:self forKeyPath:@"URL" options:NSKeyValueObservingOptionNew context:nil];
    self.htmlApi = [[PNCHtmlApi alloc]initWithWebView:webView];

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
    //NSLog(@"utf-8转码url:%@",  encodedString);
    _url = encodedString;
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
    
    [RACObserve(webView, title) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        NSString * title = (NSString *)x;
        title = title.length>18?[title substringToIndex:18]:title ;
        self.title = title ;
    }];
    
}

#pragma mark action
- (void)back{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSURL *URL = navigationAction.request.URL;
    if ([URL.scheme isEqualToString:@"http"]||
        [URL.scheme isEqualToString:@"https"]||
        [URL.scheme isEqualToString:@"file"]) {
        decisionHandler(WKNavigationActionPolicyAllow);
    }else{
        if ([[UIApplication sharedApplication]canOpenURL:URL]) {
            [[UIApplication sharedApplication]openURL:URL];
        }
        decisionHandler(WKNavigationActionPolicyCancel);
    }
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        !completionHandler?:completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        !completionHandler?:completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        !completionHandler?:completionHandler(YES);
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        !completionHandler?:completionHandler(alertController.textFields[0].text?:@"");
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void*)context{
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSLog(@"当前加载的url == %@",self.webView.URL.absoluteString);
}


#pragma mark - <private>
- (void)dealloc {
    //防止内存泄露
    [_webView removeObserver:self forKeyPath:@"URL"];
    BEELog(@"dealloc");

}

@end

@interface WeakScriptMessageHandler()
@end
@implementation WeakScriptMessageHandler
static WeakScriptMessageHandler *_instance = nil;
- (instancetype)init{
    if (self = [super init]) {
        _handlers = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

+ (void)addName:(NSString *)name receiveMessage:(WebViewReceiveScriptMessageBlock)block{
    [[self shareInstance] addName:name receiveMessage:block];
}

- (void)addName:(NSString *)name receiveMessage:(WebViewReceiveScriptMessageBlock)block{
    if (!name || name.length == 0) {
        NSError *error = [NSError errorWithDomain:@"name不能为空" code:111 userInfo:nil];
        block(nil,error);
        return;
    }
    _handlers[name] = block;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSString *key = message.name;
    if (!key) {
        NSLog(@"请检查js代码是否有误");
        return;
    }
    WebViewReceiveScriptMessageBlock block = _handlers[key];
    !block?:block(message,nil);
}
@end
