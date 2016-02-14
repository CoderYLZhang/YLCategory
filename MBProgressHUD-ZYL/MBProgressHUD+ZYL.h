//
//  MBProgressHUD+ZYL.h
//
//  Created by 张银龙 on 14-6-6.
//  Copyright (c) 2014年 张银龙. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (ZYL)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
