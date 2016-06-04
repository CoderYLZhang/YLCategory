//
//  NSObject + Extension.h
//
//
//  Created by 张银龙 on 16/6/4.
//  Copyright © 2016年 张银龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SystemBrightnessValue) {
    
    SystemBrightnessValueSaveDefault,
    SystemBrightnessValueRestoreDefault,
    SystemBrightnessValueMin,
    SystemBrightnessValueMax,
    SystemBrightnessValueMid
};

@interface NSObject (Extension)

/** 当前屏幕亮度 */
@property (nonatomic, assign) CGFloat userBrightness;

- (void)changeSystemBrightness: (SystemBrightnessValue) switchValue;

@end







