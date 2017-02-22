//
//  NSString+YLCategory.m
//  自定义cell
//
//  Created by 张银龙 on 14/12/8.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "NSString+YLCategory.h"

@implementation NSString (YLCategory)

+ (CGSize)sizeWithText:(NSString *)text font:(CGFloat)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}

- (CGSize)sizeWithFont:(CGFloat)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self sizeWithAttributes:attrs];
}

/** 邮箱加密 1234567@163.com */
+ (NSString *)stringEncryptWithEmail:(NSString *)emailStr {
    
    NSUInteger length = [emailStr rangeOfString:@"@" options:NSBackwardsSearch].location - 1 - 1;
    NSMutableString *newEmailStr = [NSMutableString stringWithString:emailStr];
    NSMutableString *star = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [star appendString:@"*"];
    }
    [newEmailStr replaceCharactersInRange:NSMakeRange(1, length) withString:star];
    
    return newEmailStr;
}

/**
 设置段落样式
 
 @param lineSpacing 行高
 @param textcolor 字体颜色
 @param font 字体
 @return 返回富文本字体
 */
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                            textColor:(UIColor *)textcolor
                                             textFont:(UIFont *)font {
    return [self stringWithParagraphlineSpeace:lineSpacing textColor:textcolor textFont:font compated:nil];
}

/**
 返回包含关键字的富文本编辑
 
 @param lineSpacing     行高
 @param textcolor       字体颜色
 @param font            字体
 @param KeyColor        关键字字体颜色
 @param KeyFont         关键字字体
 @param KeyWords        关键字数组
 @return                返回包含关键字的富文本编辑
 */
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                            textColor:(UIColor *)textcolor
                                             textFont:(UIFont *)font
                                         keyTextColor:(UIColor *)KeyColor
                                              keyFont:(UIFont *)KeyFont
                                             keyWords:(NSArray *)KeyWords {
    
    NSAttributedString * AttributeString = [self stringWithParagraphlineSpeace:lineSpacing textColor:textcolor textFont:font compated:^(NSMutableAttributedString *attriStr) {
        NSDictionary * KeyattriBute = @{NSForegroundColorAttributeName:KeyColor,NSFontAttributeName:KeyFont};
        for (NSString * item in KeyWords) {
            NSRange  range = [self rangeOfString:item options:(NSCaseInsensitiveSearch)];
            [attriStr addAttributes:KeyattriBute range:range];
        }
    }];
    return AttributeString;
}

- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                            textColor:(UIColor *)textcolor
                                             textFont:(UIFont *)font
                                             compated:(void(^)(NSMutableAttributedString * attriStr))compalted {
    // 设置段落
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    // NSKernAttributeName字体间距
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName:paragraphStyle};
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    // 创建文字属性
    NSDictionary * attriBute = @{NSForegroundColorAttributeName:textcolor,NSFontAttributeName:font};
    [attriStr addAttributes:attriBute range:NSMakeRange(0, self.length)];
    if (compalted) {
        compalted(attriStr);
    }
    return attriStr;
}

/**
 返回包含关键字的富文本编辑
 
 @param lineSpacing     行高
 @param normalFC        普通文字的属性字典
 @param keyWords        关键字数组
 @param keyFC           关键字的属性字典
 @return                返回包含关键字的富文本编辑
 */
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                    normalAttributeFC:(NSDictionary *)normalFC
                                         keyTextColor:(NSArray *)keyWords
                                       keyAttributeFC:(NSDictionary *)keyFC {
    NSAttributedString * AttributeString = [self stringWithParagraphlineSpeace:lineSpacing attributeFC:normalFC compated:^(NSMutableAttributedString *attriStr) {
        
        for (NSString * item in keyWords) {
            NSRange  range = [self rangeOfString:item options:(NSCaseInsensitiveSearch)];
            [attriStr addAttributes:keyFC range:range];
        }
    }];
    return AttributeString;
}


- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                          attributeFC:(NSDictionary *)attributeFC
                                             compated:(void(^)(NSMutableAttributedString * attriStr))compalted {
    // 设置段落
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    // NSKernAttributeName字体间距
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName:paragraphStyle,NSKernAttributeName:@.5f};
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    // 创建文字属性
    //NSDictionary * attriBute = @{NSForegroundColorAttributeName:textcolor,NSFontAttributeName:font};
    
    [attriStr addAttributes:attributeFC range:NSMakeRange(0, self.length)];
    if (compalted) {
        compalted(attriStr);
    }
    return attriStr;
}

/**
 计算富文本字体高度
 
 @param lineSpeace      行高
 @param font            字体
 @param width           字体所占宽度
 @return                富文本高度
 */
- (CGFloat)heightParagraphSpeace:(CGFloat)lineSpeace font:(UIFont*)font width:(CGFloat)width {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle};
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}


@end
