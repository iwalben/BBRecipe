//
//  BEEHSectionView.m
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHSectionView.h"

@interface BEEHSectionView ()
@property (nonatomic , strong)UILabel * authorTitle;
@property(nonatomic,assign) BOOL isViewLayout;
@end

@implementation BEEHSectionView

-(instancetype)initWithTitle:(NSString *)title
{
    if (self == [super init]) {
        self.backgroundColor = BEEdColor;
        [self addSubview:self.authorTitle];
        self.authorTitle.text = title;
        _isViewLayout = NO ;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = BEEdColor;
        [self addSubview:self.authorTitle];
        _isViewLayout = NO ;
    }
    return self;
}

-(UILabel *)authorTitle
{
    if (!_authorTitle) {
        _authorTitle = [[UILabel alloc]init];
        _authorTitle.textAlignment = NSTextAlignmentLeft;
        _authorTitle.text = @"人气菜谱TOP5";
        _authorTitle.textColor = BEEcColor;
        _authorTitle.font = BEEBOLDSYSTEMFONT(16);
    }
    return _authorTitle;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_isViewLayout == NO) {// 如果视图没有布局
        [self.authorTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(BEEZoomW(14));
            make.centerY.mas_equalTo(self);
        }];
        _isViewLayout = YES ;
    }
}

@end
