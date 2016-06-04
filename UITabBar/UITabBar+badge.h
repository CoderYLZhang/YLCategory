//
//  UITabBar+badge.h
//  RuiFuTech
//
//  Created by yinlong on 16/6/2.
//  Copyright © 2016年 zhigang.li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)

/** 显示小红点 */
- (void)showBadgeOnItemIndex:(NSInteger)index;
/** 隐藏标志 */
- (void)hideBadgeOnItemIndex:(NSInteger)index;
/** 显示数字提醒 */
- (void)showBadgeNumber:(NSInteger)number OnItemIndex:(NSInteger)index;

@end
