//
//  BEEBaseViewProtocol.h
//  Dishes
//
//  Created by Roddick on 2019/11/21.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol  BEEBaseViewProtocol<NSObject>

@optional
-(void)initAppearValue;
-(void)bee_bindViewModel;
-(instancetype)initWithViewModel:(id)viewModel;

@end


@protocol  BEELoadingButtonProtocol<NSObject>

@required
-(void)setup;

@optional
- (void)startLoadingAnimation;
- (void)stopLoadingAnimation;

@end

