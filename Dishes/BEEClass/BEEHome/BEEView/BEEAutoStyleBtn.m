//
//  BEEAutoStyleBtn.m
//  Dishes
//
//  Created by Roddick on 2019/11/25.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEAutoStyleBtn.h"

@interface BEEAutoStyleBtn ()
@property (nonatomic ,strong)UIImageView * iconImagV;
@property (nonatomic ,strong)UILabel * titleL;
@end

@implementation BEEAutoStyleBtn

-(void)initAppearValue
{
    [self addSubview:self.iconImagV];
    [self addSubview:self.titleL];
    
    self.backgroundColor = UIColor.clearColor ;
    [self.iconImagV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.width.height.mas_offset(BEEZoomW(25));
        make.top.mas_offset(BEEZoomW(6));
    }];
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.top.mas_equalTo(self.iconImagV.mas_bottom).offset(BEEZoomW(6));
    }];
}

-(UIImageView *)iconImagV
{
    if (!_iconImagV) {
        _iconImagV = [UIImageView new];
    }
    return _iconImagV ;
}

-(UILabel *)titleL
{
    if (!_titleL) {
        _titleL = [UILabel new];
        _titleL.textAlignment = NSTextAlignmentCenter ;
        _titleL.textColor = BEEcColor;
        _titleL.font = [UIFont systemFontOfSize:BEEZoomW(12)];
    }
    return _titleL ;
}

-(void)setHomeActiveViewImage:(NSString *)imageName title:(NSString *)title
{
    self.iconImagV.image = [UIImage imageNamed:imageName];
    self.titleL.text = title ;
}

@end
