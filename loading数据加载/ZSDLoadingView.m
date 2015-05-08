//
//  ZSDLoadingView.m
//  Qian100
//
//  Created by shaw on 15/4/13.
//  Copyright (c) 2015年 ZOSENDA. All rights reserved.
//-------------------数据加载loading-----------------------

#import "ZSDLoadingView.h"

#define kLoadingAnimationDuration 0.6f

@interface ZSDLoadingView ()

@property (nonatomic,strong) UIImageView *animationView;
@property (nonatomic,strong) UIImageView *frontView;

@end

@implementation ZSDLoadingView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.frame = [UIScreen mainScreen].bounds;
        
        [self setup];
    }
    
    return self;
}

-(void)setup
{
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    
    if(!_frontView)
    {
        _frontView = [[UIImageView alloc]init];
        _frontView.translatesAutoresizingMaskIntoConstraints = NO;
        _frontView.image = [UIImage imageNamed:@"star"];
        [self addSubview:_frontView];
    }
    
    if(!_animationView)
    {
        _animationView = [[UIImageView alloc]init];
        _animationView.translatesAutoresizingMaskIntoConstraints = NO;
        _animationView.image = [UIImage imageNamed:@"icon_loding_out"];
        [self addSubview:_animationView];
    }
    
    [self addViewConstraint];
}

-(void)addViewConstraint
{
    CGSize frontViewSize = _frontView.image.size;//CGSizeMake(35.0f, 35.0f);
    CGSize animationViewSize = _animationView.image.size;//CGSizeMake(40.0f, 40.0f);
    NSLayoutConstraint *frontView_W = [NSLayoutConstraint constraintWithItem:_frontView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:frontViewSize.width];
    NSLayoutConstraint *frontView_H = [NSLayoutConstraint constraintWithItem:_frontView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:frontViewSize.height];
    NSLayoutConstraint *frontView_CX = [NSLayoutConstraint constraintWithItem:_frontView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *frontView_CY = [NSLayoutConstraint constraintWithItem:_frontView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:-44.0f];
    [self addConstraint:frontView_W];
    [self addConstraint:frontView_H];
    [self addConstraint:frontView_CX];
    [self addConstraint:frontView_CY];
    
    NSLayoutConstraint *aniView_W = [NSLayoutConstraint constraintWithItem:_animationView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:animationViewSize.width];
    NSLayoutConstraint *aniView_H = [NSLayoutConstraint constraintWithItem:_animationView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:animationViewSize.height];
    NSLayoutConstraint *aniView_CX = [NSLayoutConstraint constraintWithItem:_animationView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *aniView_CY = [NSLayoutConstraint constraintWithItem:_animationView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:-44.0f];
    [self addConstraint:aniView_W];
    [self addConstraint:aniView_H];
    [self addConstraint:aniView_CX];
    [self addConstraint:aniView_CY];
}

-(void)beginLoading
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = kLoadingAnimationDuration;
    animation.fromValue = @0;
    animation.toValue = @(M_PI * 2);
    animation.repeatCount = MAXFLOAT;
    [_animationView.layer addAnimation:animation forKey:@"LoadingAnimation"];
}

-(void)endLoading
{
//    [_animationView.layer removeAnimationForKey:@"LoadingAnimation"];
    [_animationView.layer removeAllAnimations];
}

-(void)showInView:(UIView *)baseView
{
    [baseView addSubview:self];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *self_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[self]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(self)];
    NSArray *self_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(self)];
    [baseView addConstraints:self_H];
    [baseView addConstraints:self_V];
    
    [self beginLoading];
}

-(void)dismiss
{
    [self endLoading];
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
