//
//  UIView+Loading.m
//  Qian100
//
//  Created by shaw on 15/4/13.
//  Copyright (c) 2015年 ZOSENDA. All rights reserved.
//

#import "UIView+Loading.h"
#import "ZSDLoadingView.h"

#define kLoadingTag 10000

@implementation UIView (Loading)

-(void)addLoading
{
    ZSDLoadingView *loading = [[ZSDLoadingView alloc]init];
    loading.tag = kLoadingTag;
    [loading showInView:self];
}

-(void)removeLoading
{
    ZSDLoadingView *loading = (ZSDLoadingView *)[self viewWithTag:kLoadingTag];
    [loading dismiss];
}

@end
