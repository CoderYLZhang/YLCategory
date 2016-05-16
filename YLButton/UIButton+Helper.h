//
//  UIButton+Helper.h
//  防止按钮连续点击
//
//  Created by yinlong on 16/5/12.
//  Copyright © 2016年 yinlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Helper)

/** 按钮点击的间隔时间 */
@property (nonatomic, assign) NSTimeInterval clickDurationTime;

@end
