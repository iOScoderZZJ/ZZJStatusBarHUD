//
//  ZZJStatusBarHUD.m
//  ZZJStatusBarHUD
//
//  Created by chefuzzj on 16/3/30.
//  Copyright © 2016年 chefuzzj. All rights reserved.
//

#import "ZZJStatusBarHUD.h"

#define ZZMessageFont [UIFont systemFontOfSize:12]
/** 动画时间 */
static CGFloat const ZZJAnimationTime = 0.25;

@implementation ZZJStatusBarHUD
static UIWindow * window_;
static NSTimer * timer_;

+(void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"ZZJStatusBarHUD.bundle/duigou"]];
    
}

+(void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"ZZJStatusBarHUD.bundle/iconfont-cha"]];
}

+(void)showLoading:(NSString *)msg
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;

    [self setupWindow];
    
    UILabel * messageLabel = [[UILabel alloc] init];
    messageLabel.font = ZZMessageFont;
    messageLabel.frame = window_.bounds;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.text = msg;
    messageLabel.textColor = [UIColor whiteColor];
    [window_ addSubview:messageLabel];
    
    //添加菊花
    UIActivityIndicatorView * loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGFloat labelW = [msg sizeWithAttributes:@{NSFontAttributeName : ZZMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - labelW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [loadingView startAnimating];
    [window_ addSubview:loadingView];
}

+(void)hide
{
    
    [UIView animateWithDuration:ZZJAnimationTime animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

+(void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"ZZJStatusBarHUD.bundle/iconfont-tishi"]];
}

+(void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    
    [self setupWindow];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [button setImage:image forState:UIControlStateNormal];
    button.titleLabel.font = ZZMessageFont;
    if (image) {
        [button setTitle:msg forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [window_ addSubview:button];
    
    //定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+(void)setupWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, 20);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.backgroundColor = [UIColor blackColor];
    window_.frame = frame;
    window_.hidden = NO;
    window_.windowLevel = UIWindowLevelAlert;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:ZZJAnimationTime animations:^{
        window_.frame = frame;
    }];

}
@end
