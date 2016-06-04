//
//  YLAlertTool.h
//  alertTool
//
//  Created by yinlong on 16/6/4.
//  Copyright © 2016年 yinlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^AlertBlock)();

@interface YLAlertTool : NSObject

// 只带 title
+ (void)showAlertWithTitle:(NSString *)title;

// 带 title 以及 展示内容
+ (void)showAlertWithTitle:(NSString *)title andContent:(NSString *)content;

// 带 title 以及展示 和 按钮 以及 按钮行为
+ (void)showAlertWithTitle:(NSString *)title andContent:(NSString*)content andDoAction:(AlertBlock)doAction;

// 带 title 和 两个按钮
+ (void)showChooseAlertWithTitle:(NSString *)title;

// 带 title 以及展示 和 两个按钮
+ (void)showChooseAlertWithTitle:(NSString *)title andContent:(NSString*)content;

// 带 title 以及展示 和 两个按钮 以及 按钮行为
+ (void)showChooseAlertWithTitle:(NSString *)title andContent:(NSString*)content andDoAction:(AlertBlock)doAction;

@end
