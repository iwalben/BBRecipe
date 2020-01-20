//
//  MJLoginViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJLoginViewController.h"
#import "BEELoginButton.h"

@interface MJLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *localBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UITextField *pswField;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet BEELoginButton *loginBtn;

/** isLogin */
@property (assign ,nonatomic) BOOL  isLogin;
@end

@implementation MJLoginViewController
{
    NSDictionary * _parameters ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录/注册";
    self.pswField.secureTextEntry = YES ;
    self.headImageView.layer.masksToBounds = YES ;
    self.headImageView.layer.cornerRadius = 20 ;
}

+ (instancetype)loginViewController
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil ]lastObject];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (IBAction)loginClick {
    [self.view endEditing:YES];
    if (self.phoneField.text.length <= 0 || self.pswField.text.length <= 0) {
        [YBProgressHUD showErrorMessage:@"请检查参数!"];
        return ;
    }
    
    [self.loginBtn startLoadingAnimation];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"user_name"] = self.phoneField.text;
    params[@"password"] = self.pswField.text;
    
    [[BEENetworkTool shareInstance] requestJsonPost:@"/app/login" params:params.copy successBlock:^(NSDictionary * _Nonnull responseObject) {
        NSLog(@"responseObject =  %@",responseObject);
        NSLog(@"接受数据时间:%@",[NSDate date]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"开始操作时间:%@",[NSDate date]);
            [self.loginBtn stopLoadingAnimation];
            if ([responseObject[@"status"][@"err_code"] isEqual:@(0)]) {
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BEELoginStatue];
                [self dismissViewControllerAnimated:YES completion:nil];
                !self.loginBlock?:self.loginBlock(YES ,nil);
            }else{
                [YBProgressHUD showErrorMessage:responseObject[@"status"][@"err_msg"]];
            }
        });
    } failBlock:^(NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.loginBtn stopLoadingAnimation];
            [YBProgressHUD showErrorMessage:@"请稍后再试"];
        });
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (instancetype)initWithRouteParameters:(NSDictionary <NSString *, id> *)parameters
{
    self = [super init];

    _parameters = [parameters copy]; // hold on to do something with later on
    NSLog(@"_parameters  =  %@",_parameters);

    return self;
}

@end
