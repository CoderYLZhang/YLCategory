//
//  UITextField+XMGExtension.m
//
//
//  Created by 张银龙 on 14/12/14.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "UITextField+YLExtension.h"

static NSString * const YLPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (YLExtension)

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    
    // 提前设置占位文字, 目的 : 让它提前创建placeholderLabel
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    
    // 恢复到默认的占位文字颜色
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    // 设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:YLPlaceholderColorKey];
}

- (UIColor *)placeholderColor{
    return [self valueForKeyPath:YLPlaceholderColorKey];
}

@end
