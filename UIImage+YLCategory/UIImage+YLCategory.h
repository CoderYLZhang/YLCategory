//
//  UIImage+YLCategory.h
//  图片拉伸
//
//  Created by 张银龙 on 14/12/8.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLCategory)
//拉伸图片
+ (UIImage *)resizableImage:(NSString *)imgName;
// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;
//图片高亮无默认颜色
+ (instancetype)imageWithOriginalName:(NSString *)imageName;
//无边框裁剪圆
+ (UIImage*)imageClipWithName:(UIImage*)image;
//有边框裁剪圆
+ (UIImage*)imageClipWithBorder:(CGFloat)border color:(UIColor*)color Image:(UIImage*)image;
//切圆角
+ (UIImage*)imageClipWithRounded:(CGFloat)RoundedRect name:(UIImage*)image;

@end
