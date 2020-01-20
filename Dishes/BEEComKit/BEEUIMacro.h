//
//  BEEUIMacro.h
//  Dishes
//
//  Created by Roddick on 2019/11/20.
//  Copyright © 2019 Roddick. All rights reserved.
//

#ifndef BEEUIMacro_h
#define BEEUIMacro_h

#import "BEEShopsController.h"
#import "BEEIssueController.h"
#import "BEEHomeController.h"
#import "BEECategoryController.h"
#import "BEEMineController.h"


static NSString * BEELoginStatue = @"BEELoginSuccess";
static NSString * BEEPolicyStatue = @"BEEPolicyAgreement";

//主屏幕 宽 高
#define BEEW [UIScreen mainScreen].bounds.size.width
#define BEEH [UIScreen mainScreen].bounds.size.height
#define BEEisIPHONEXSeries  ((CGRectGetHeight([[UIScreen mainScreen] bounds]) >= 812.0f)? (YES):(NO))
#define BEEStatusBarHeight (BEEH >= 812.0 ? 44 : 20)
#define BEENavigationBarHeight (BEEH >= 812.0 ? 88 : 64)
#define BEESafeAreaBottomHeight (BEEH >= 812.0 ? 34 : 0)
#define BEETabbarBottomHeight (BEEH >= 812.0 ? 83 : 49)

//屏幕缩放比 IPHONE8为标准
#define BEEZoomH(_height) (([UIScreen mainScreen].bounds.size.height == 568)?((_height)* 568.0/667.0):(([UIScreen mainScreen].bounds.size.height==667)?(_height):(([UIScreen mainScreen].bounds.size.height==480)?((_height)*568.0/667.0):((_height)*736.0/667.0))))
#define BEEZoomW(_width) (([UIScreen mainScreen].bounds.size.width == 320)?((_width)* 320.0/375.0):(([UIScreen mainScreen].bounds.size.width==375)?(_width):((_width)*414.0/375.0)))

//颜色
#define GaColor [UIColor jk_colorWithHex:0xFFFFFF]  //白底
#define GbColor [UIColor jk_colorWithHex:0x333333]
#define GcColor [UIColor jk_colorWithHex:0xF5F5F5]  //灰底
#define GdColor [UIColor jk_colorWithHex:0xC2C2C2]
#define GeColor [UIColor jk_colorWithHex:0xD6B88D]
#define GfColor [UIColor jk_colorWithHex:0xDFA569]
#define GhColor [UIColor jk_colorWithHex:0xF5F5F5]
#define GiColor [UIColor jk_colorWithHex:0xCECECE]
#define GjColor [UIColor jk_colorWithHex:0x999999]
#define GkColor [UIColor jk_colorWithHex:0x6A8DEB]
#define GlColor [UIColor jk_colorWithHex:0xF16A6A] //暗红
#define GmColor [UIColor jk_colorWithHex:0x666666] //文字灰
#define GnColor [UIColor jk_colorWithHex:0xBD9760]
#define GoColor [UIColor jk_colorWithHex:0x8CBCF9]
#define GpColor [UIColor jk_colorWithHex:0xC4C4C4] //线条灰
#define GqColor [UIColor jk_colorWithHex:0xD8BA8F] //indicate
#define GrColor [UIColor jk_colorWithHex:0xCD4343] //黑红
#define GsColor [UIColor jk_colorWithHex:0xE9E9E9] //淡灰
#define GtColor [UIColor jk_colorWithHex:0xC7C7C7] //字体淡灰灰
#define GuColor [UIColor jk_colorWithHex:0xF6F6F6] //图片背景灰
#define GvColor [UIColor jk_colorWithHex:0xF4F4F4] //线条淡灰
#define GwColor [UIColor jk_colorWithHex:0xFF5959] //红
#define GxColor [UIColor jk_colorWithHex:0xEFEFEF] //边框灰
#define GyColor [UIColor jk_colorWithHex:0xCCCCCC] //线条淡淡淡灰


#define BEEaColor [UIColor jk_colorWithHex:0xFFDD57] //导航栏颜色
#define BEEbColor [UIColor jk_colorWithHex:0xFFFBEB]
#define BEEcColor [UIColor jk_colorWithHex:0x232000] //黑粗字体
#define BEEdColor [UIColor jk_colorWithHex:0xECECEC] //背景灰
#define BEEeColor [UIColor jk_colorWithHex:0x232000] //文字黑
#define BEEfColor [UIColor jk_colorWithHex:0x6C6C6C] //文字淡黑
#define BEEgColor [UIColor jk_colorWithHex:0xF56212] //文字暗红
#define BEEhColor [UIColor jk_colorWithHex:0xFEE3D3] //背景暗红
#define BEEiColor [UIColor jk_colorWithHex:0x9DA7B2] //搜索文字背景灰
#define BEEjColor [UIColor jk_colorWithHex:0xEAD37F] //分类选择框选中
#define BEEkColor [UIColor jk_colorWithHex:0xFCF5DE] //分类选择框未选中
#define BEElColor [UIColor jk_colorWithHex:0x7E7E7E] //详情文字淡灰
#define BEEmColor [UIColor jk_colorWithHex:0xF1F1F1] //cell背景淡灰
#define BEEnColor [UIColor jk_colorWithHex:0xC5C5C5] //cell线条灰
#define BEEoColor [UIColor jk_colorWithHex:0x727272] //cell文字淡灰
#define BEEpColor [UIColor jk_colorWithHex:0xE5A628] //按钮黄
#define BEEqColor [UIColor jk_colorWithHex:0xADADAD] //按钮灰黑
#define BEErColor [UIColor jk_colorWithHex:0xCFCFCF] //搜索线条暗黑
#define BEEsColor [UIColor jk_colorWithHex:0xFFFFFF]



// 字体大小(常规/粗体)
#define BEEBOLDSYSTEMFONT(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define BEESYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]


// View 圆角和加边框
#define BEEViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


// View 圆角
#define BEEViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// UIImage
#define LC_IMAGE(imgName) [UIImage imageNamed:imgName]

// URL
#define LCURL(url) [NSURL URLWithString:url]


// 日志输出
#ifdef DEBUG
#define BEELog(...) NSLog(__VA_ARGS__)
#else
#define BEELog(...)
#endif

//非空字符串
#define BEENotNullStr(obj,nullObj) obj ? \
([obj isKindOfClass:[NSString class]] ? obj : \
([obj isKindOfClass:[NSNumber class]] ? [(NSNumber *)obj stringValue] : nullObj)) : \
nullObj

//单例宏
// .h
#define single_interface(class)  + (class *)shared##class;

// .m
// \ 代表下一行也属于宏
// ## 是分隔符
#define single_implementation(class) \
static class *_instance; \
\
+ (class *)shared##class \
{ \
if (_instance == nil) { \
_instance = [[self alloc] init]; \
} \
return _instance; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
}


#endif /* BEEUIMacro_h */
