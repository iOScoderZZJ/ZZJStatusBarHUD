//
//  ZZJStatusBarHUD.h
//  ZZJStatusBarHUD
//
//  Created by chefuzzj on 16/3/30.
//  Copyright © 2016年 chefuzzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZZJStatusBarHUD : NSObject
/** 显示成功 */
+(void)showSuccess:(NSString *)msg;
/** 显示失败 */
+(void)showError:(NSString *)msg;
/** 显示加载 */
+(void)showLoading:(NSString *)msg;
/** 隐藏HUD */
+(void)hide;
/** 显示普通信息 */
+(void)showMessage:(NSString *)msg;
/** 显示普通信息,自定义显示图片 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image;
@end
