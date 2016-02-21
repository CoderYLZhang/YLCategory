//
//  UIImage+YLCategory.m
//  图片拉伸
//
//  Created by 张银龙 on 14/12/8.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "UIImage+YLCategory.h"

@implementation UIImage (YLCategory)

/** 拉伸图片 */
+(UIImage *)resizableImage:(NSString *)imgName{

        UIImage *img = [UIImage imageNamed:imgName];
        CGFloat w = img.size.width * 0.5;
        CGFloat h = img.size.height * 0.5;
        return [img resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];

}
/** 根据颜色生成一张尺寸为1*1的相同颜色图片 */
+ (UIImage *)imageWithColor:(UIColor *)color{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}
/** 图片高亮无默认颜色 */
+(instancetype)imageOriginalName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
/** 无边框裁剪原 */
+ (UIImage*)imageClipWithImage:(UIImage*)image{
    
    return [self imageClipWithBorder:0 color:nil Image:image];
}
/** 有边框裁剪圆 */
+ (UIImage*)imageClipWithBorder:(CGFloat)border color:(UIColor*)color image:(UIImage*)image{
    //1.加载图片
    //2.设置边框
    //3.开启位图上下文
    //    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width + 2 * border, image.size.width + 2 * border), NO, 0);
    //4.设置边框路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width + 2 * border, image.size.height + 2 * border)];
    [color set];
    [path fill];
    //5.设置裁剪区域
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, image.size.width, image.size.height)];
    [path2 addClip];
    //6.填充图片
    [image drawAtPoint:CGPointMake(border, border)];
    //7.从上下文读取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}
/** 切圆角 */
+ (UIImage*)imageClipWithRounded:(CGFloat)RoundedRect image:(UIImage*)image{
    //1.加载图片
    //2.开启位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //3.设置裁剪路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, image.size.width, image.size.height) cornerRadius:RoundedRect];
    [path addClip];
    //4.填充图片
    [image drawAtPoint:CGPointMake(0, 0)];
    //5.从上下文中读取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    //6.关闭上下文
    UIGraphicsEndImageContext();
    return image;
}
@end
