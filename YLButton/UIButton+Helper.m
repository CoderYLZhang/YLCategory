//
//  UIButton+Helper.m
//  防止按钮连续点击
//
//  Created by yinlong on 16/5/12.
//  Copyright © 2016年 yinlong. All rights reserved.
//

#import "UIButton+Helper.h"
#import <objc/runtime.h>

/** 默认的按钮点击时间 */
static const NSTimeInterval defaultDuration = 3.0;
/** 记录是否忽略按钮点击事件，默认第一次执行事件 */
static BOOL _isIgnoreEvent = NO;
/** 设置执行按钮事件状态 */
static void resetState() {
    _isIgnoreEvent = NO;
    
}


@implementation UIButton (Helper)

// 在这方法搅拌
+ (void)load {
    
    Method originMethod = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method newMethod = class_getInstanceMethod([self class], @selector(yl_sendAction:to:forEvent:));
    
    method_exchangeImplementations(originMethod, newMethod);
}

- (void)yl_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if ([self isKindOfClass:[UIButton class]]) {
        //1. 按钮点击间隔事件
        self.clickDurationTime = self.clickDurationTime == 0 ? defaultDuration : self.clickDurationTime;
        
        //2. 是否忽略按钮点击事件
        if (_isIgnoreEvent) {
            //2.1 忽略按钮事件
            
            // 直接拦截掉super函数进行发送消息
            return;
            
        } else if(self.clickDurationTime > 0) {
            //2.2 不忽略按钮事件
            
            // 后续在间隔时间内直接忽略按钮事件
            _isIgnoreEvent = YES;
            
            // 间隔事件后，执行按钮事件
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.clickDurationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                resetState();
            });
            
            // 发送按钮点击消息
            [self yl_sendAction:action to:target forEvent:event];
        }
    } else {
        [self yl_sendAction:action to:target forEvent:event];
    }
}


#pragma mark - 动态添加属性
- (void)setClickDurationTime:(NSTimeInterval)clickDurationTime {
    objc_setAssociatedObject(self, @selector(clickDurationTime), @(clickDurationTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimeInterval)clickDurationTime {
    return [objc_getAssociatedObject(self, @selector(clickDurationTime)) doubleValue];
}

@end
