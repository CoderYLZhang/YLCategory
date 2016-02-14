//
//  YLTextField.m
//  
//
//  Created by 张银龙 on 14/12/14.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "YLTextField.h"


@interface YLTextField ()


@end

@implementation YLTextField

#pragma mark ---------- 通过Xib创建
- (void)awakeFromNib{

    self.tintColor = [UIColor whiteColor];
    [self setAttributedPlaceholderWithColor:[UIColor grayColor]];
    //[self addTarget];
}
#pragma mark ---------- 通过代码创建
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tintColor = [UIColor whiteColor];
        [self setAttributedPlaceholderWithColor:[UIColor grayColor]];
        //[self addTarget];
    }
    return self;
}
#pragma mark ---------- 更改颜色
- (void)setAttributedPlaceholderWithColor:(UIColor*)color{
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    attributes[NSForegroundColorAttributeName] = color;
    
    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.placeholder attributes:attributes];
}

//--------------------- 利用内部的某些机制实现
#pragma mark ---------- 成为第一响应者
- (BOOL)becomeFirstResponder{
    
    [self setAttributedPlaceholderWithColor:[UIColor whiteColor]];
    return [super becomeFirstResponder];
}
#pragma mark ---------- 失去第一响应者
- (BOOL)resignFirstResponder{
    
    [self setAttributedPlaceholderWithColor:[UIColor grayColor]];
    return [super resignFirstResponder];
}


//--------------------- 通过addTarget实现:
#pragma mark ---------- addTarget
- (void)addTarget{
    
    [self addTarget:self action:@selector(didBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(didEndEditing) forControlEvents:UIControlEventEditingDidEnd];
}
#pragma mark ---------- 开始编辑
- (void)didBeginEditing{
    
    [self setAttributedPlaceholderWithColor:[UIColor whiteColor]];
}
#pragma mark ---------- 结束编辑
- (void)didEndEditing{
    
    [self setAttributedPlaceholderWithColor:[UIColor grayColor]];
}

@end
