//
//  UITabBar+badge.m
//  RuiFuTech
//
//  Created by yinlong on 16/6/2.
//  Copyright © 2016年 zhigang.li. All rights reserved.
//

#import "UITabBar+badge.h"


#define TabbarItemNums 4.0    // tabbar的数量
//数字角标直径
#define NumMark_W_H 16

@implementation UITabBar (badge)

- (void)showBadgeOnItemIndex:(NSInteger)index {
    
    // 移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    // 新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 428 + index;
    badgeView.layer.cornerRadius = 4;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = self.frame;
    
    // 确定小红点的位置
    float percentX = (index + 0.6) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 8, 8);
    [self addSubview:badgeView];
    
}

- (void)showBadgeNumber:(NSInteger)number OnItemIndex:(NSInteger)index {
    
    UILabel *numLabel =[[UILabel alloc]init];
    numLabel.tag = 428 + index;
    numLabel.backgroundColor = [UIColor redColor];
    numLabel.font = [UIFont systemFontOfSize:10];
    numLabel.textColor = [UIColor whiteColor];
    numLabel.textAlignment = NSTextAlignmentCenter;
    
    
    CGRect tabFrame = self.frame;
    CGFloat numLabelWidth = 0;
    
    if (number <= 0) {
        [self removeBadgeOnItemIndex:index];
    }
    // 数字不同,改变frame
    if(number > 0 && number<=9)
    {
        numLabelWidth = NumMark_W_H;
    }
    else if (number > 9 && number <= 19)
    {
        numLabelWidth = NumMark_W_H + 5;
    }
    else
    {
        numLabelWidth = NumMark_W_H + 10;
    }
    
    float percentX = (index + 0.6) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    numLabel.frame = CGRectMake(x, y, numLabelWidth, NumMark_W_H);
    numLabel.layer.cornerRadius = NumMark_W_H * 0.5;
    numLabel.layer.masksToBounds = YES;
    numLabel.text = [NSString stringWithFormat:@"%ld",number];
    
    if(number > 99)
    {
        numLabel.text =@"99+";
    }
    [self addSubview:numLabel];
    
}

- (void)hideBadgeOnItemIndex:(NSInteger)index {
    
    // 移除小红点
    [self removeBadgeOnItemIndex:index];
    
}

- (void)removeBadgeOnItemIndex:(NSInteger)index {
    
    // 按照tag值进行移除
    for (UIView *subView in self.subviews) {
        
        if (subView.tag == 428 + index) {
            
            [subView removeFromSuperview];
        }
    }
}
@end
