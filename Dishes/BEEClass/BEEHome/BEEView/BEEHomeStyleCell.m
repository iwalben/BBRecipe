//
//  BEEHomeStyleCell.m
//  Dishes
//
//  Created by Roddick on 2019/11/25.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeStyleCell.h"

@interface BEEHomeStyleCell ()

@property (nonatomic ,strong) UIImageView * leftImageView;
@property (nonatomic ,strong) UILabel * titleL;
@property (nonatomic ,strong) UILabel * tagsL;
@property (nonatomic ,strong) UILabel * issueL;
@property (nonatomic ,strong) UILabel * collectL;

@end

@implementation BEEHomeStyleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone ;
        self.backgroundColor = UIColor.whiteColor  ;
        [self.contentView addSubview:self.leftImageView];
        [self.contentView addSubview:self.titleL];
        [self.contentView addSubview:self.tagsL];
        [self.contentView addSubview:self.issueL];
        [self.contentView addSubview:self.collectL];
        
        [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(BEEZoomW(10));
            make.left.mas_offset(BEEZoomW(10));
            make.width.mas_offset(BEEZoomW(166));
            make.height.mas_offset(BEEZoomW(100));
        }];
        
        [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(BEEZoomW(5));
            make.top.mas_equalTo(self.leftImageView);
        }];
        
        
        [self.collectL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(BEEZoomW(5));
            make.bottom.mas_equalTo(self.leftImageView);
        }];
        
        [self.issueL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(BEEZoomW(5));
            make.bottom.mas_equalTo(self.collectL.mas_top).mas_offset(-BEEZoomW(10));
        }];
        
        [self.tagsL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(BEEZoomW(5));
            make.right.mas_offset(-2);
            make.bottom.mas_equalTo(self.issueL.mas_top).mas_offset(-BEEZoomW(10));
        }];
    }
    return self;
}



-(void)setModel:(BEEMineDishesShopsModel *)model
{
    _model = model ;
    
    _leftImageView.image =  [UIImage imageNamed:model.imageName] ;
    _titleL.text = model.title0;
    _tagsL.text = model.title1;
    _issueL.text = model.title2;
    _collectL.text =  model.title3;
}


-(UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
        _leftImageView.contentMode = UIViewContentModeScaleAspectFill;
        _leftImageView.backgroundColor = UIColor.lightGrayColor;
        _leftImageView.layer.cornerRadius = 5;
        _leftImageView.layer.masksToBounds = YES;
    }
    return _leftImageView ;
}


-(UILabel *)titleL
{
    if (!_titleL) {
        _titleL = [UILabel new];
        _titleL.textColor = BEEeColor ;
        _titleL.font = BEESYSTEMFONT(13);
    }
    return _titleL ;
}

-(UILabel *)tagsL
{
    if (!_tagsL) {
        _tagsL = [UILabel new];
        _tagsL.numberOfLines = 0 ;
        _tagsL.textColor = BEEfColor ;
        _tagsL.font = BEESYSTEMFONT(12);
    }
    return _tagsL ;
}

-(UILabel *)issueL
{
    if (!_issueL) {
        _issueL = [UILabel new];
        _issueL.textColor = BEEfColor ;
        _issueL.font = BEESYSTEMFONT(12);
    }
    return _issueL ;
}


-(UILabel *)collectL
{
    if (!_collectL) {
        _collectL = [UILabel new];
        _collectL.textColor = BEEgColor ;
        _collectL.font = BEESYSTEMFONT(12);
        _collectL.backgroundColor = BEEhColor;
    }
    return _collectL ;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

#pragma mark - BEEMineDishesShopsCell -

@interface BEEMineDishesShopsCell ()
@property (nonatomic ,strong) UIImageView * leftImageView;
@property (nonatomic ,strong) UILabel * titleL;
@property (nonatomic ,strong) UILabel * tagsL;
@property (nonatomic ,strong) UILabel * issueL;
@property (nonatomic ,strong) UILabel * collectL;
@property (nonatomic ,strong)UIImageView * radioImageV ;
@end

@implementation BEEMineDishesShopsCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone ;
        self.backgroundColor = UIColor.whiteColor  ;
        [self.contentView addSubview:self.leftImageView];
        [self.contentView addSubview:self.titleL];
        [self.contentView addSubview:self.tagsL];
        [self.contentView addSubview:self.issueL];
        [self.contentView addSubview:self.collectL];
        
        [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(BEEZoomW(10));
            make.left.mas_offset(BEEZoomW(50));
            make.width.mas_offset(BEEZoomW(166));
            make.height.mas_offset(BEEZoomW(100));
        }];
        
        [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(BEEZoomW(5));
            make.top.mas_equalTo(self.leftImageView);
        }];
        
        
        [self.collectL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(BEEZoomW(5));
            make.bottom.mas_equalTo(self.leftImageView);
        }];
        
        [self.issueL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(BEEZoomW(5));
            make.bottom.mas_equalTo(self.collectL.mas_top).mas_offset(-BEEZoomW(10));
        }];
        
        [self.tagsL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(BEEZoomW(5));
            make.bottom.mas_equalTo(self.issueL.mas_top).mas_offset(-BEEZoomW(10));
        }];
        
        [self.contentView addSubview:self.radioImageV];
        [self.radioImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(BEEZoomW(16));
            make.width.height.mas_offset(BEEZoomW(18));
            make.centerY.mas_equalTo(self.leftImageView);
        }];
        
        UIView * line = [UIView new];
        line.backgroundColor = BEEnColor ;
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_offset(0);
            make.height.mas_offset(1);
        }];
    }
    return self;
}


-(void)setModel:(BEEMineDishesShopsModel *)model
{
    _model = model ;
    
    _leftImageView.image =  [UIImage imageNamed:model.imageName] ;
    _titleL.text = model.title0;
    _tagsL.text = model.title1;
    _issueL.text = model.title2;
    _collectL.text =  model.title3;
    if (model.isSelected) {
        self.radioImageV.image = [UIImage imageNamed:@"icon_wancheng"];
    }else{
        self.radioImageV.image = [UIImage imageNamed:@"icon_wanchengbianji"];
    }
}

-(UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
        _leftImageView.contentMode = UIViewContentModeScaleAspectFill;
        _leftImageView.backgroundColor = UIColor.lightGrayColor;
        _leftImageView.layer.cornerRadius = 5;
        _leftImageView.layer.masksToBounds = YES;
    }
    return _leftImageView ;
}

-(UIImageView *)radioImageV
{
    if (!_radioImageV) {
        _radioImageV = [UIImageView new];
        _radioImageV.image = [UIImage imageNamed:@"icon_wanchengbianji"];
    }
    return _radioImageV ;
}


-(UILabel *)titleL
{
    if (!_titleL) {
        _titleL = [UILabel new];
        _titleL.textColor = BEEeColor ;
        _titleL.font = BEESYSTEMFONT(13);
    }
    return _titleL ;
}

-(UILabel *)tagsL
{
    if (!_tagsL) {
        _tagsL = [UILabel new];
        _tagsL.textColor = BEEfColor ;
        _tagsL.font = BEESYSTEMFONT(12);
    }
    return _tagsL ;
}

-(UILabel *)issueL
{
    if (!_issueL) {
        _issueL = [UILabel new];
        _issueL.textColor = BEEfColor ;
        _issueL.font = BEESYSTEMFONT(12);
    }
    return _issueL ;
}


-(UILabel *)collectL
{
    if (!_collectL) {
        _collectL = [UILabel new];
        _collectL.textColor = BEEgColor ;
        _collectL.font = BEESYSTEMFONT(12);
        _collectL.backgroundColor = BEEhColor;
    }
    return _collectL ;
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
