//
//  BEEHomeHorizontalCell.m
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHomeHorizontalCell.h"

@interface BEEHomeHorizontalCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic ,strong) UILabel *tipsLabel;
@end

@implementation BEEHomeHorizontalCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = BEEdColor ;
        UILabel *topTitleLabel = [[UILabel alloc]init];
        self.tipsLabel = topTitleLabel ;
        topTitleLabel.text = @"最新菜谱";
        topTitleLabel.font = BEEBOLDSYSTEMFONT(16);
        topTitleLabel.textColor = BEEcColor;
        [self.contentView addSubview:topTitleLabel];
        
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(BEEZoomW(166), BEEZoomW(139));
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, BEEZoomW(30)  , BEEW, BEEZoomW(159)) collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        [self.collectionView setShowsHorizontalScrollIndicator:NO];
        self.collectionView.backgroundColor = UIColor.whiteColor;
        [self.collectionView registerClass:[BEEHomeHorizontalItemCell class] forCellWithReuseIdentifier:@"BEEHomeHorizontalItemCellID"];
        [self.contentView addSubview:self.collectionView];
        
        //layout
        [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(20);
            make.top.mas_offset(10);
        }];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BEEMineDishesShopsModel *model = self.newestDatas[indexPath.row];
    NSString * url = [NSString stringWithFormat:@"BEERouter://push/BEEHomeDiesDetailController/%@",[BEEMineDishesShopsModel jsonStringWithNSDictionary:model.detail]];
    [YBRoutes openURL:url];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.newestDatas.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BEEHomeHorizontalItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BEEHomeHorizontalItemCellID" forIndexPath:indexPath];
    cell.model = self.newestDatas[indexPath.row];
    return cell;
}

@end


#pragma mark - BEEHomeHorizontalCellShopsDetailCell

@interface BEEHomeHorizontalCellShopsDetailCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic ,strong) UILabel *tipsLabel;
@end

@implementation BEEHomeHorizontalCellShopsDetailCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.whiteColor ;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(BEEZoomW(166), BEEZoomW(139));
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, BEEZoomW(10)  , BEEW, BEEZoomW(159)) collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        [self.collectionView setShowsHorizontalScrollIndicator:NO];
        self.collectionView.backgroundColor = UIColor.whiteColor;
        [self.collectionView registerClass:[BEEHomeHorizontalItemCell class] forCellWithReuseIdentifier:@"BEEHomeHorizontalItemCellID"];
        [self.contentView addSubview:self.collectionView];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BEEMineDishesShopsModel *model = self.newestDatas[indexPath.row];
    NSString * url = [NSString stringWithFormat:@"BEERouter://push/BEEHomeDiesDetailController/%@",[BEEMineDishesShopsModel jsonStringWithNSDictionary:model.detail]];
    [YBRoutes openURL:url];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.newestDatas.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BEEHomeHorizontalItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BEEHomeHorizontalItemCellID" forIndexPath:indexPath];
    cell.model = self.newestDatas[indexPath.row];
    return cell;
}

@end

#pragma mark - BEEHomeHorizontalItemCell
@interface BEEHomeHorizontalItemCell ()
@property (nonatomic ,strong) UIImageView *imageView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *subTitleLabel;
@end

@implementation BEEHomeHorizontalItemCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initializeView];
    }
    return self;
}

-(void)setModel:(BEEMineDishesShopsModel *)model
{
    _model = model ;
    self.imageView.image = [UIImage imageNamed:model.imageName];
    self.titleLabel.text = model.title0;
    self.subTitleLabel.text = model.title1;
}

- (void)initializeView{
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pho_newcai"]];
    self.imageView.layer.cornerRadius = 5;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.backgroundColor = UIColor.lightGrayColor;
    [self.contentView addSubview:self.imageView];
    
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textAlignment = NSTextAlignmentCenter ;
    self.titleLabel.font = [UIFont systemFontOfSize:BEEZoomW(13)];
    self.titleLabel.textColor = BEEeColor;
    self.titleLabel.text = @"-";
    [self.contentView addSubview:self.titleLabel];
    
    
    self.subTitleLabel = [UILabel new];
    self.subTitleLabel.textAlignment = NSTextAlignmentCenter ;
    self.subTitleLabel.text = @"-";
    self.subTitleLabel.font = [UIFont systemFontOfSize:BEEZoomW(12)];
    self.subTitleLabel.textColor = BEEfColor;
    [self.contentView addSubview:self.subTitleLabel];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = UIColor.whiteColor;
    bgView.layer.cornerRadius = 3;
    bgView.layer.shadowOpacity = 0.6;
    bgView.layer.shadowColor = BEEaColor.CGColor;
    bgView.layer.shadowRadius = 3;
    bgView.layer.shadowOffset = CGSizeMake(0, 0);
    [self.contentView insertSubview:bgView atIndex:0];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(0);
        make.height.mas_offset(BEEZoomW(90));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(BEEZoomW(5));
        make.centerX.mas_offset(0);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(BEEZoomW(5));
        make.centerX.mas_offset(0);
    }];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
    

}
@end
