//
//  BEELoginButton.h
//  Dishes
//
//  Created by Roddick on 2019/12/12.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEELoginButton.h"

@implementation BEELoginButton

- (void)setup
{
    self.titleLabel.font =  [UIFont systemFontOfSize:15];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5.f;
    [self setBackgroundImage:[UIImage jk_imageWithColor:BEEaColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage jk_imageWithColor:BEEaColor] forState:UIControlStateSelected];
    [self setTitle:@"登录/注册" forState:UIControlStateNormal];
    [self setTitleColor:BEEeColor forState:UIControlStateNormal];
    [self setTitleColor:BEEeColor forState:UIControlStateSelected];
    [self setNeedsUpdateConstraints];
}
@end
