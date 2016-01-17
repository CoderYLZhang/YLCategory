//
//  NSDictionary+log.m
//  多值参数和输出中文
//
//  Created by 张银龙 on 16/1/17.
//  Copyright © 2016年 张银龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation NSDictionary (log)


- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    
    NSMutableString *strM = [NSMutableString string];
    
    [strM appendString:@"{"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        [strM appendFormat:@"%@:",key];
        [strM appendFormat:@"%@,",obj];
        
    }];
    
    NSRange range = [strM rangeOfString:@","options:NSBackwardsSearch];
    if (range.length != NSNotFound) {
        [strM deleteCharactersInRange:range];
    }
    
    [strM appendString:@"}"];
    return strM;
}

@end


@implementation NSArray (log)


- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    
    NSMutableString *strM = [NSMutableString string];
    
    [strM appendString:@"[\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [strM appendFormat:@"%@,\n",obj];
    }];
    
    NSRange range = [strM rangeOfString:@","options:NSBackwardsSearch];
    if (range.length != NSNotFound) {
        [strM deleteCharactersInRange:range];
    }
    
    [strM appendString:@"\n]"];
    return strM;
}

@end