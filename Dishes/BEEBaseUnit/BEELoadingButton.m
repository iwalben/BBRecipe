//
//  BEELoadingButton.m
//  Dishes
//
//  Created by Roddick on 2019/12/12.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEELoadingButton.h"

@interface BEELoadingButton ()
@property (nonatomic, strong) UIActivityIndicatorView *loginIndicator;
@end

@implementation BEELoadingButton

-(instancetype)init
{
    if (self == [super init]) {
        [self setup];
    }
    return self ;
}

-(instancetype)initWithCoder:(NSCoder *)coder
{
    if (self == [super initWithCoder:coder]) {
        [self setup];
    }
    return self;
}

- (void)setup
{

}

- (void)updateConstraints
{
    [self.loginIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
    
    [super updateConstraints];
}

#pragma mark - Public
- (void)startLoadingAnimation
{
    self.enabled = NO ;
    [self setTitle:@"" forState:UIControlStateNormal];
    [self.loginIndicator startAnimating];
}

- (void)stopLoadingAnimation
{
    self.enabled = YES ;
    [self setTitle:self.titleLabel.text?:@"" forState:UIControlStateNormal];
    [self.loginIndicator stopAnimating];
}

#pragma mark - Getter
- (UIActivityIndicatorView *)loginIndicator
{
    if (!_loginIndicator) {
        _loginIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _loginIndicator.hidesWhenStopped = YES;
        [self addSubview:self.loginIndicator];
    }
    return _loginIndicator;
}
@end
