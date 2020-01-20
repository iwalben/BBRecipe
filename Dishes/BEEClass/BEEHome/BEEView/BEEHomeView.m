//
//  BEEHomeView.m
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeView.h"
#import "BEEHomeViewModel.h"
#import "BEEHomeServeViewModel.h"
#import "BEEAutoStyleBtn.h"
#import <objc/runtime.h>


@interface BEEHomeView()
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) BEEHomeViewModel * viewModel;
@property (nonatomic ,strong) BEEHomeServeViewModel * serveViewModel;
@property (nonatomic ,strong) UIView * headView;
@property (nonatomic ,strong) BEEHomeTopBar * topBar;
@property (nonatomic ,strong) UITextField * textField;
@end


@implementation BEEHomeView

-(void)initAppearValue
{
    self.tableView.tableHeaderView = self.headView ;
    self.viewModel = [[BEEHomeViewModel alloc]bindViewModelWithTableView:self.tableView];
    self.serveViewModel = [[BEEHomeServeViewModel alloc]bindServeViewMdoelWithTableView:self.tableView];
    self.userInteractionEnabled = YES ;
    [self addSubview:self.topBar];
    
    
    [RACObserve(self.tableView,contentOffset)subscribeNext:^(NSNumber *x) {
        CGPoint offset = [x CGPointValue];
        CGFloat Y = offset.y;
        if (Y<0) {
            self.topBar.textField.alpha = (BEENavigationBarHeight-fabs(Y))/BEENavigationBarHeight;
            self.topBar.tLabel.alpha = fabs(Y)/BEENavigationBarHeight ;
        }else{
            self.topBar.textField.alpha = 1;
            self.topBar.tLabel.alpha = 0 ;
        }
    }];
}


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEH - BEETabbarBottomHeight) style:UITableViewStyleGrouped];
        //_tableView = [[UITableView alloc]initWithFrame:self.frame style:UITableViewStyleGrouped];
        _tableView.contentInset = UIEdgeInsetsMake(BEENavigationBarHeight-BEEStatusBarHeight, 0, 0, 0);
        [self addSubview:_tableView];
    }
    return _tableView ;
}

-(BEEHomeTopBar *)topBar
{
    if (!_topBar) {
        _topBar = [[BEEHomeTopBar alloc]initWithFrame:CGRectMake(0, 0, BEEW , BEENavigationBarHeight) barStyle:BEEHomeStyleCellStyleNone];
        _topBar.textField.enabled = NO ;
        [_topBar jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [YBRoutes openURL:@"BEERouter://push/BEEHomeSearchController"];
        }];
    }
    return _topBar  ;
}


-(UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, BEEW, BEEZoomW(105))];
        _headView.backgroundColor = BEEbColor;
        
        
        UIView * containView = [UIView new];
        containView.backgroundColor = [UIColor clearColor];
        [_headView addSubview:containView];
        [containView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.right.mas_offset(-10);
            make.height.mas_offset(30);
            make.top.mas_offset(10);
        }];
        
        [containView jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [YBRoutes openURL:@"BEERouter://push/BEEHomeSearchController"];
        }];
        
        self.textField = [[UITextField alloc]init];
        self.textField.enabled = NO ;
        self.textField.layer.cornerRadius = 15;
        self.textField.layer.masksToBounds = YES;
        self.textField.placeholder = @" 搜索 共112菜谱";
        Ivar ivar =  class_getInstanceVariable([UITextField class], "_placeholderLabel");
        UILabel *placeholderLabel = object_getIvar(self.textField, ivar);
        placeholderLabel.textColor = BEEiColor;
        self.textField.font = BEESYSTEMFONT(14);
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.textField.leftViewMode = UITextFieldViewModeAlways;
        self.textField.backgroundColor = BEEdColor;
        self.textField.leftView = ({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
            view.backgroundColor = [UIColor colorWithWhite:0 alpha:0];

            UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search"]];
            [view addSubview:icon];
            [icon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(10);
                make.right.top.bottom.mas_offset(0);
            }];
            view;
        });
        [containView addSubview:self.textField];

        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_offset(0);
        }];
        
        NSArray * titles = @[@"热炒",@"凉菜",@"点心",@"面食",@"煲/汤"];
        NSArray * normalImages = @[@"icon_热炒",@"icon_凉菜",@"icon_点心",@"icon_面食",@"icon_汤"];
        
        for (int i = 0 ; i < normalImages.count; i++) {
            BEEAutoStyleBtn * activeV = [[BEEAutoStyleBtn alloc] init];
            @weakify(self)
            [activeV jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
                @strongify(self)
                !self.currentIndexBlock?:self.currentIndexBlock(i+100);
            }];
            [activeV setHomeActiveViewImage:normalImages[i] title:titles[i]] ;
            [_headView addSubview:activeV];
            CGFloat width = BEEW/5 ;
            [activeV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_offset(BEEZoomW(60));
                make.bottom.mas_offset(0);
                make.left.mas_offset(i*width);
                make.width.mas_offset(width);
            }];
        }
    }
    return _headView ;
}


@end

#pragma mark -- BEEHomeTopBar --

@interface BEEHomeTopBar ()

@end

@implementation BEEHomeTopBar

-(instancetype)initWithFrame:(CGRect)frame barStyle:(BEEHomeTopBarStyle)style
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUISyle:style];
    }
    return self;
}

- (void)setUpUISyle:(BEEHomeTopBarStyle)style{
    
    self.backgroundView = [UIView new];
    self.backgroundView.backgroundColor = BEEaColor;
    self.backgroundView.alpha = 1;
    [self addSubview:self.backgroundView];
    self.backgroundView.layer.shadowColor = [UIColor lightGrayColor].CGColor; //shadowColor阴影颜色
    self.backgroundView.layer.shadowOffset = CGSizeMake(2.0f , 2.0f); //shadowOffset阴影偏移x，y向(上/下)偏移(-/+)2
    self.backgroundView.layer.shadowOpacity = 0.2f;//阴影透明度，默认0
    self.backgroundView.layer.shadowRadius = 2.0f;
    
    self.textField = [[UITextField alloc]init];
    self.textField.layer.cornerRadius = 15;
    self.textField.layer.masksToBounds = YES;
    self.textField.placeholder = @" 搜索 共112菜谱";
    
    self.textField.font = BEESYSTEMFONT(14);
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.backgroundColor = [UIColor whiteColor];
    self.textField.leftView = ({
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
        view.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        
        UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search"]];
        [view addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.right.top.bottom.mas_offset(0);
        }];
        view;
    });
    
    if (style == BEEHomeStyleCellStyleArrow ) {
        [self addSubview:self.backButton];
        [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.width.height.mas_offset(30);
            make.bottom.mas_offset(-8);
        }];
        [self addSubview:self.textField];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.backButton.mas_right).offset(15);
            make.right.mas_offset(-10);
            make.height.mas_equalTo(30);
            make.bottom.mas_offset(-8);
        }];
        
    }else{
        [self addSubview:self.textField];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.right.mas_offset(-10);
            make.height.mas_equalTo(30);
            make.bottom.mas_offset(-8);
        }];
        [self addSubview:self.tLabel];
        [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_offset(0);
            make.bottom.mas_offset(-8);
        }];
    }
    

    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
    
}

-(UILabel *)tLabel
{
    if (!_tLabel) {
        _tLabel = [UILabel new];
        _tLabel.text = @"沪上名菜谱";
        _tLabel.textColor = GbColor;
        _tLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return _tLabel ;
}

- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"icon_back"] forState:0];
        [_backButton jk_addActionHandler:^(NSInteger tag) {
           [YBRoutes openURL:@"BEERouter://pop/nil"];
        }];
    }
    return _backButton;
}

@end

