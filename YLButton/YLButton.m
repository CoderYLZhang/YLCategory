//
//  YLButton.m
//  
//
//  Created by 张银龙 on 14/12/8.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "YLButton.h"

@implementation YLButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = imageW;
    self.imageView.frame = CGRectMake(0, 0, imageW, imageH);
    CGFloat titleW = imageW;
    CGFloat titleH = self.frame.size.height - imageH;
    CGFloat titleY = imageH;
    self.titleLabel.frame = CGRectMake(0, titleY, titleW, titleH);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
    
}

@end
