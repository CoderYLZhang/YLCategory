//
//  NSString+YLCategory.h
//  自定义cell
//
//  Created by 张银龙 on 14/12/8.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 过期提醒
#define AddititonsDeprecated(instead) NS_DEPRECATED(1_0, 1_0, 2_0, 2_0, instead)

@interface NSString (YLCategory)

+ (CGSize)sizeWithText:(NSString *)text font:(CGFloat)font maxSize:(CGSize)maxSize;

- (CGSize)sizeWithFont:(CGFloat)font maxSize:(CGSize)maxSize;

- (CGSize)sizeWithFont:(UIFont *)font;

/** 邮箱加密 */
+ (NSString *)stringEncryptWithEmail:(NSString *)emailStr;

/**
 设置段落样式

 @param lineSpacing 行高
 @param textcolor 字体颜色
 @param font 字体
 @return 返回富文本字体
 */
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                            textColor:(UIColor *)textcolor
                                             textFont:(UIFont *)font ;


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
                                             keyWords:(NSArray *)KeyWords AddititonsDeprecated("使用stringWithParagraphlineSpeace: NormalAttributeFC: withKeyTextColor:KeyAttributeFC:");


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
                                       keyAttributeFC:(NSDictionary *)keyFC;


/**
 计算富文本字体高度

 @param lineSpeace      行高
 @param font            字体
 @param width           字体所占宽度
 @return                富文本高度
 */
- (CGFloat)heightParagraphSpeace:(CGFloat)lineSpeace font:(UIFont*)font width:(CGFloat)width;



@end
