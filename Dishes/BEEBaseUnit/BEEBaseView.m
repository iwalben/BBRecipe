//
//  BEEBaseView.m
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEBaseView.h"

@implementation BEEBaseView

-(instancetype)init
{
    if (self = [super init]) {
    }
    return self ;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initAppearValue];
        [self bee_bindViewModel];
    }
    return self ;
}

-(instancetype)initWithViewModel:(id)viewModel
{
    if (self = [super init]) {
    }
    return self ;
}

/**
 让子类去重写的方法
 */
-(void)initAppearValue{}


-(void)bee_bindViewModel{}

@end
