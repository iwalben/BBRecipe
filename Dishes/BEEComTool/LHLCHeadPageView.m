//
//  LHLCHeadPageView.m
//  LHLC
//
//  Created by WalkerCloud on 2019/4/8.
//  Copyright © 2019年 Sameway. All rights reserved.
//

#import "LHLCHeadPageView.h"

#define lcLineHeight 1

@interface LHLCHeadPageView ()
@property(nonatomic,strong)UIImageView *indicator;
@property(nonatomic,strong)UIScrollView *headerScrollView;
@property(nonatomic,strong)UIButton *currentButton;
@property(nonatomic,strong)NSArray *items;
@end

@implementation LHLCHeadPageView

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray <__kindof NSString *>*)items backgroundColor:(UIColor *)bColor seletedBackgroundColor:(UIColor *)bSeletedColor
{
    self = [self initWithFrame:frame items:items];
    for (int index = 0 ; index < items.count; index ++ ) {
        UIButton *button = [_headerScrollView viewWithTag:index + 100];
        [button setTitleColor:BEEcColor forState:UIControlStateNormal];
        [button setTitleColor:BEEcColor forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage jk_imageWithColor:bColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage jk_imageWithColor:bSeletedColor] forState:UIControlStateSelected];
    }
    self.indicator.hidden = YES ;
    return self ;
}


- (instancetype)initWithFrame:(CGRect)frame
                        items:(NSArray <__kindof NSString *>*)items{
    
    if (self = [super initWithFrame:frame]) {
        _currentIndex = 0;
        _defaultIndex = 0;
        _items = items;
        //当item的count 大于四个时，使用可滑动item
        self.headerScrollView = ({
            UIScrollView *scrollView = [[UIScrollView alloc]init];
            scrollView.frame = self.bounds;
            scrollView.backgroundColor = UIColor.whiteColor;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.layer.shadowColor = [UIColor lightGrayColor].CGColor; //shadowColor阴影颜色
            scrollView.layer.shadowOffset = CGSizeMake(2.0f , 2.0f); //shadowOffset阴影偏移x，y向(上/下)偏移(-/+)2
            scrollView.layer.shadowOpacity = 0.2f;//阴影透明度，默认0
            scrollView.layer.shadowRadius = 2.0f;
            scrollView;
        });
        
        [self addSubview:self.headerScrollView];
        
        CGFloat w;
        if (items.count > 5) {
            w = (frame.size.width - 50) / 4;
        }else{
            w = frame.size.width/items.count;
        }
        CGFloat h = frame.size.height;
        for (int i = 0; i < items.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button.titleLabel setFont:BEEBOLDSYSTEMFONT(16)];
            [button setTitle:items[i] forState:0];
            [button setTitleColor:GjColor forState:0];
            [button setTitleColor:GnColor forState:UIControlStateSelected];
            [button sizeToFit];
            button.tag = i + 100;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake(i * w, 0, w, h);
            [self.headerScrollView addSubview:button];
        }
        
        _headerScrollView.contentSize = CGSizeMake(w * items.count, h);
        
        _indicator = [UIImageView new];
        _indicator.image = [UIImage jk_imageWithColor:GnColor];
        _indicator.jk_width = 30;
        _indicator.jk_height = 2;
        _indicator.jk_top = self.headerScrollView.jk_height - _indicator.jk_height;
        _indicator.jk_right = 0;
        [self.headerScrollView addSubview:_indicator];
    }
    return self ;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    if (newSuperview) {
        id sender = [self.headerScrollView viewWithTag:100 + self.defaultIndex];
        if ([sender isKindOfClass:[UIButton class]]) {
            [self buttonAction:sender];
        }else{
            [self buttonAction:[self.headerScrollView viewWithTag:100]];
        }
    }
}

- (BOOL)selectIndex:(NSInteger)index{
    UIButton *button = [_headerScrollView viewWithTag:index + 100];
    if (!button) {
        return NO;
    }
    [self buttonAction:button];
    return YES;
}

- (void)buttonAction:(UIButton *)sender{
    if (sender == self.currentButton) {
        return;
    }
    sender.selected = YES;
    self.currentButton.selected = NO;
    self.currentButton = sender;
    
    [UIView animateWithDuration:0.3 animations:^{
        //        if (sender.titleLabel.jk_width > 0) {
        //            self.indicator.jk_width = sender.titleLabel.jk_width;
        //        }
        self.indicator.jk_centerX = sender.jk_centerX;
    }];
    
    CGFloat offsetX = sender.jk_centerX - self.jk_width * 0.5;
    CGFloat maxOffsetX = self.headerScrollView.contentSize.width - self.jk_width;
    if (offsetX < 0) {
        offsetX = 0;
    } else if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [self.headerScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    if (self.currentIndexBlock) {
        self.currentIndexBlock(sender.tag);
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end

#pragma mark - BEECategoryHeadPageView

@interface BEECategoryHeadPageView ()
@property(nonatomic,strong)UIScrollView *headerScrollView;
@property(nonatomic,strong)BEECategoryItemButton *currentButton;
@property(nonatomic,strong)NSArray *items;
@end


@implementation BEECategoryHeadPageView
- (instancetype)initWithFrame:(CGRect)frame
                   titleItems:(NSArray <__kindof NSString *>*)titleItems
             imageNormalItems:(NSArray <__kindof NSString *>*)imagenormalItems
            imageSelectedItems:(NSArray <__kindof NSString *>*)imageSelectedItems{
    
    if (self = [super initWithFrame:frame]) {
        _currentIndex = 0;
        _defaultIndex = 0;
        _items = titleItems;
        //当item的count 大于四个时，使用可滑动item
        self.headerScrollView = ({
            UIScrollView *scrollView = [[UIScrollView alloc]init];
            scrollView.frame = self.bounds;
            scrollView.backgroundColor = UIColor.whiteColor;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.layer.shadowColor = [UIColor lightGrayColor].CGColor; //shadowColor阴影颜色
            scrollView.layer.shadowOffset = CGSizeMake(2.0f , 2.0f); //shadowOffset阴影偏移x，y向(上/下)偏移(-/+)2
            scrollView.layer.shadowOpacity = 0.2f;//阴影透明度，默认0
            scrollView.layer.shadowRadius = 2.0f;
            scrollView;
        });
        
        [self addSubview:self.headerScrollView];
        
        CGFloat w;
        if (titleItems.count > 5) {
            w = (frame.size.width - 50) / 4;
        }else{
            w = frame.size.width/titleItems.count;
        }
        CGFloat h = frame.size.height;
        for (int i = 0; i < titleItems.count; i++) {
            BEECategoryItemButton *button = [[BEECategoryItemButton alloc]init];
            [button setBackgroundImage:[UIImage jk_imageWithColor:BEEkColor] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage jk_imageWithColor:BEEjColor] forState:UIControlStateSelected];
            
            [button setImage:[UIImage imageNamed:imagenormalItems[i]] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:imageSelectedItems[i]] forState:UIControlStateSelected];

            [button setTitle:titleItems[i] forState:UIControlStateNormal];
            [button setTitle:titleItems[i] forState:UIControlStateSelected];

            [button sizeToFit];
            button.tag = i + 100;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake(i * w, 0, w, h);
            [self.headerScrollView addSubview:button];
        }
        
        _headerScrollView.contentSize = CGSizeMake(w * titleItems.count, h);
    }
    return self ;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    if (newSuperview) {
        id sender = [self.headerScrollView viewWithTag:100 + self.defaultIndex];
        if ([sender isKindOfClass:[UIButton class]]) {
            [self buttonAction:sender];
        }else{
            [self buttonAction:[self.headerScrollView viewWithTag:100]];
        }
    }
}

- (BOOL)selectIndex:(NSInteger)index{
    BEECategoryItemButton *button = [_headerScrollView viewWithTag:index + 100];
    if (!button) {
        return NO;
    }
    [self buttonAction:button];
    return YES;
}

- (void)buttonAction:(BEECategoryItemButton *)sender{
    if (sender == self.currentButton) {
        return;
    }
    sender.item_selected = YES;
    self.currentButton.item_selected = NO;
    self.currentButton = sender;
    
    CGFloat offsetX = sender.jk_centerX - self.jk_width * 0.5;
    CGFloat maxOffsetX = self.headerScrollView.contentSize.width - self.jk_width;
    if (offsetX < 0) {
        offsetX = 0;
    } else if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [self.headerScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    if (self.currentIndexBlock) {
        self.currentIndexBlock(sender.tag);
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end

#pragma mark - BEECategoryItemButton

@interface BEECategoryItemButton ()
@property (nonatomic ,strong) UIImageView * imageView;
@property (nonatomic ,strong) UIImageView * backImageView;
@property (nonatomic ,strong) UILabel * label ;


@property (nonatomic ,strong) NSMutableDictionary * backImageDictionary;
@property (nonatomic ,strong) NSMutableDictionary * imageDictionary;
@property (nonatomic ,strong) NSMutableDictionary * labelDictionary;
@end

@implementation BEECategoryItemButton

-(instancetype)init
{
    if (self == [super init]) {
        [self addSubview:self.backImageView];
        [self addSubview:self.imageView];
        [self addSubview:self.label];
        
        [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_offset(0);
        }];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(BEEZoomW(10));
            make.width.height.mas_offset(BEEZoomW(25));
            make.centerX.mas_offset(0);
        }];
        
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(BEEZoomW(10));
            make.centerX.mas_offset(0);
        }];
        
    }
    return self;
}
-(NSMutableDictionary *)backImageDictionary
{
    if (!_backImageDictionary) {
        _backImageDictionary = [NSMutableDictionary dictionary];
    }
    return _backImageDictionary ;
}
-(NSMutableDictionary *)imageDictionary
{
    if (!_imageDictionary) {
        _imageDictionary = [NSMutableDictionary dictionary];
    }
    return _imageDictionary ;
}
-(NSMutableDictionary *)labelDictionary
{
    if (!_labelDictionary) {
        _labelDictionary = [NSMutableDictionary dictionary];
    }
    return _labelDictionary ;
}
-(UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [UIImageView new];
    }
    return _backImageView ;
}
-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView ;
}
-(UILabel *)label
{
    if (!_label) {
        _label = [UILabel new];
        _label.textColor = GbColor ;
        _label.textAlignment = NSTextAlignmentCenter ;
        _label.font = BEESYSTEMFONT(14);
    }
    return _label ;
}

-(void)setItem_selected:(BOOL)item_selected
{
    if (item_selected) {
        self.backImageView.image = [self.backImageDictionary objectForKey:[NSString stringWithFormat:@"%@",@(UIControlStateSelected)]];
        self.label.text = [self.labelDictionary objectForKey:[NSString stringWithFormat:@"%@",@(UIControlStateSelected)]];
        self.imageView.image = [self.imageDictionary objectForKey:[NSString stringWithFormat:@"%@",@(UIControlStateSelected)]];
    }else{
        self.backImageView.image = [self.backImageDictionary objectForKey:[NSString stringWithFormat:@"%@",@(UIControlStateNormal)]];
        self.label.text = [self.labelDictionary objectForKey:[NSString stringWithFormat:@"%@",@(UIControlStateNormal)]];
        self.imageView.image = [self.imageDictionary objectForKey:[NSString stringWithFormat:@"%@",@(UIControlStateNormal)]];
    }
}

- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state{
    [self.labelDictionary setValue:title forKey:[NSString stringWithFormat:@"%@",@(state)]];
    self.item_selected = NO ;
}

- (void)setImage:(nullable UIImage *)image forState:(UIControlState)state{
    [self.imageDictionary setValue:image forKey:[NSString stringWithFormat:@"%@",@(state)]];
    self.item_selected = NO ;
}

- (void)setBackgroundImage:(nullable UIImage *)image forState:(UIControlState)state{
    [self.backImageDictionary setValue:image forKey:[NSString stringWithFormat:@"%@",@(state)]];
    self.item_selected = NO ;
}


@end

