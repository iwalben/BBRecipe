//
//  LHLCHeadPageView.h
//  LHLC
//
//  Created by WalkerCloud on 2019/4/8.
//  Copyright © 2019年 Sameway. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHLCHeadPageView : UIView
- (instancetype)initWithFrame:(CGRect)frame
                        items:(NSArray <__kindof NSString *>*)items;

@property (nonatomic ,assign) NSInteger defaultIndex;

@property (nonatomic ,assign) NSInteger currentIndex;

@property (nonatomic ,copy) void(^currentIndexBlock)(NSInteger);

- (BOOL)selectIndex:(NSInteger)index;

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray <__kindof NSString *>*)items backgroundColor:(UIColor *)bColor seletedBackgroundColor:(UIColor *)bSeletedColor;
@end


@interface BEECategoryHeadPageView : UIView
- (instancetype)initWithFrame:(CGRect)frame
                        titleItems:(NSArray <__kindof NSString *>*)titleItems
                        imageNormalItems:(NSArray <__kindof NSString *>*)imagenormalItems
                        imageSelectedItems:(NSArray <__kindof NSString *>*)imageSelectedItems;

@property (nonatomic ,assign) NSInteger defaultIndex;

@property (nonatomic ,assign) NSInteger currentIndex;

@property (nonatomic ,copy) void(^currentIndexBlock)(NSInteger);

- (BOOL)selectIndex:(NSInteger)index;
@end


@interface BEECategoryItemButton : UIControl
@property (nonatomic ,assign) BOOL item_selected;
- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state;
- (void)setImage:(nullable UIImage *)image forState:(UIControlState)state;
- (void)setBackgroundImage:(nullable UIImage *)image forState:(UIControlState)state;
@end






NS_ASSUME_NONNULL_END
