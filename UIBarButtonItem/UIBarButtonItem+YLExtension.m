//
//  UIBarButtonItem+YLExtension.m
//  项目练习
//
//  Created by 张银龙 on 14/12/11.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "UIBarButtonItem+YLExtension.h"

@implementation UIBarButtonItem (YLExtension)

+ (UIBarButtonItem*)itemWithImage:(UIImage*)image hiehImage:(UIImage*)heihimage target:(id)target action:(SEL)sel{
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:heihimage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}


@end
