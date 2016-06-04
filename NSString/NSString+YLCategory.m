//
//  NSString+YLCategory.m
//  自定义cell
//
//  Created by 张银龙 on 14/12/8.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "NSString+YLCategory.h"

@implementation NSString (YLCategory)

+ (CGSize)sizeWithText:(NSString *)text font:(CGFloat)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}

- (CGSize)sizeWithFont:(CGFloat)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
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
@end
