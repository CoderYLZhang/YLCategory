//
//  NSObject + Extension.m
//
//
//  Created by 张银龙 on 16/6/4.
//  Copyright © 2016年 张银龙. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

- (void)changeSystemBrightness: (SystemBrightnessValue) switchValue {
    
    switch (switchValue) {
        case SystemBrightnessValueSaveDefault:
            self.userBrightness = [UIScreen mainScreen].brightness;
            NSLog(@"%lf",self.userBrightness);
            break;
        case SystemBrightnessValueRestoreDefault:
            NSLog(@"%lf",self.userBrightness);
            [UIScreen mainScreen].brightness = self.userBrightness;
            break;
        case SystemBrightnessValueMin:
            [UIScreen mainScreen].brightness = 0;
            break;
        case SystemBrightnessValueMax:
            [UIScreen mainScreen].brightness = 1;
            break;
        case SystemBrightnessValueMid:
            [UIScreen mainScreen].brightness = 0.5;
            break;
        default:
            [UIScreen mainScreen].brightness = self.userBrightness;
            break;
    }
}
#pragma mark - 动态添加属性
- (void)setUserBrightness:(CGFloat)userBrightness {
    objc_setAssociatedObject(self, @selector(userBrightness), @(userBrightness), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)userBrightness {
    return [objc_getAssociatedObject(self, @selector(userBrightness)) doubleValue];
}
@end







