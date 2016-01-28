//
//  NSObject+model.m
//  简单实现 MJExtension
//
//  Created by 张银龙 on 14/1/17.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "NSObject+model.h"
#import <objc/message.h>

@implementation NSObject (model)

+ (instancetype)modelWithDict:(NSDictionary*)dict{
    
    id obj = [[self alloc]init];
    
    // 把字典中的value给模型中属性赋值
    // runtime: 1.遍历模型中成员变量
    //          2.去字典中查找对应的value
    //          3.给模型中属性赋值
    // ivar:成员变量
    // 第一个参数:获取哪个类的成员变量
    // 第二个参数:类中成员变量总数
    unsigned int count;
    
    // 获取成员变量数组:注意:只会获取当前类的属性,不会获取父类
    Ivar *ivarList = class_copyIvarList(self, &count);
    //1.遍历模型中成员变量
    for (int i = 0; i < count; ++i) {
        //获取当期成员变量
        Ivar ivar = ivarList[i];
        //获取成员变量名字//_source
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        //获取成员变量类
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        //NSLog(@"%@",ivarType);
        //截取
        NSString *key = [ivarName substringFromIndex:1];//source
        //去字典里找 key 对应的值
        id value = dict[key];
        // 二级:如果是字典,转模型
        if ([value isKindOfClass:[NSDictionary class]] ) {
            
            Class modelClass = NSClassFromString(ivarType);
            
            value = [modelClass modelWithDict:value];
        }
        //给模型赋值
        [obj setValue:value forKey:key];
        
    }
    
    return obj;
}

@end
