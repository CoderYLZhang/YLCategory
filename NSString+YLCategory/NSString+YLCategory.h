//
//  NSString+YLCategory.h
//  自定义cell
//
//  Created by 张银龙 on 13/12/8.
//  Copyright © 2013年 张银龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (YLCategory)
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
