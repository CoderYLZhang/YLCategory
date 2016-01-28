//
//  NSDictionary+Property.m
//  Runtime(字典转模型KVC实现)
//
//  Created by 张银龙 on 14/1/17.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "NSDictionary+Property.h"

// isKindOfClass:判断是否是当前类或者子类

@implementation NSDictionary (Property)
// 自动生成属性代码
// @property (nonatomic, assign) NSInteger attitudes_count;
- (void)PropertyCode
{
    // 生成多少个属性代码 => 字典key
    // 创建可变字符串
    NSMutableString *codes = [NSMutableString string];
    // 私有API:苹果没有暴露出来的类
    // 遍历字典
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        NSString *code ;

        if ([value isKindOfClass:[NSString class]]) {
            //  NSString
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",key];
        } else if ([value isKindOfClass:[NSArray class]]) {
            // NSArray
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",key];
        } else if ([value isKindOfClass:[NSDictionary class]]) {
            // NSDictionary
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",key];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",key];
            
        } else if ([value isKindOfClass:[NSNumber class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",key];
        }
        
        [codes appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",codes);
    
    
}

@end
