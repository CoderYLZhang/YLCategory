//
//  UIImage+YLCategory.m
//  图片拉伸
//
//  Created by 张银龙 on 14/12/8.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "UIImage+YLCategory.h"
#import <Photos/Photos.h>



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
+ (instancetype)imageOriginalName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
/** 无边框裁剪圆 */
+ (UIImage*)imageClipWithName:(NSString*)name{
    UIImage *image =[UIImage imageNamed:name];
    return [self imageClipWithImage:image];
}
/** 无边框裁剪圆 */
+ (UIImage*)imageClipWithImage:(UIImage*)image{
    
    return [self imageClipWithBorder:0 color:nil image:image];
}
/** 有边框裁剪圆 */
+ (UIImage*)imageClipWithBorder:(CGFloat)border color:(UIColor*)color image:(UIImage*)image{
    
    if (!image) return nil;
    //1.加载图片
    //2.设置边框
    //3.开启位图上下文
    //UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
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
+ (UIImage *)imageClipWithRounded:(CGFloat)RoundedRect image:(UIImage*)image{
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
/** 把一张图加到另一张图上 */
+ (UIImage *)addImage:(UIImage*)image toBackground:(UIImage*)imageBG inSize:(CGSize)size withMargin:(CGFloat)margin {
    
    // 开启图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 把背景图片画到指定位置
    [imageBG drawInRect:(CGRect){{0, 0}, size}];
    // 把图片加到背景上
    [image drawInRect:CGRectMake(margin, margin, size.width - margin * 2, size.height - margin * 2)];
    // 从上下文中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
/** 在周边加一个边框为1的透明像素 */
- (UIImage *)imageAntialias {
    
    CGFloat border = 1.0f;
    CGRect rect = CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border);
    
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}
/** 重绘 */
- (UIImage *)thumbnaiWithSizeoutScale:(CGSize)size {
    
    UIImage *newimage;
    if (nil == self) {
        newimage = nil;
    }
    else{
        CGSize oldsize = self.size;
        CGRect rect;
        if (size.width/size.height < oldsize.width/oldsize.height) {
            rect.size.width = size.height*oldsize.width/oldsize.height;
            rect.size.height = size.height;
            rect.origin.x = (size.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = size.width;
            rect.size.height = size.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (size.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, size.width, size.height)); //clear background
        [self drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        newimage = [newimage scaleImageToSize:CGSizeMake(size.width, size.height)];
    }
    return newimage;
}
/** 图片大小 */
- (UIImage *)scaleImageToSize:(CGSize)size {
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - 保存图片到自定义相册
- (void)yl_saveToCustomAlbumWithCompletionHandler:(void (^)(BOOL success, NSError *error))handler{
    
    NSInteger oldStatus = [PHPhotoLibrary authorizationStatus];
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        if (status == PHAuthorizationStatusDenied) {
            // 如果不是第一次访问
            if (oldStatus != PHAuthorizationStatusNotDetermined) {
                handler(NO, [NSError errorWithDomain:@"用户拒绝了" code:1 userInfo:nil]);
                //提示用户打开
            }
        }else if(status == PHAuthorizationStatusAuthorized){
            // 获得【自定义相册】
            PHAssetCollection *createdCollection = self.createdCollection;
            
            // 异步执行操作
            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                
                PHObjectPlaceholder *placeholder = [PHAssetChangeRequest creationRequestForAssetFromImage:self].placeholderForCreatedAsset;
                // 将对应的相册传入，创建一个【相册修改请求】对象
                PHAssetCollectionChangeRequest *collectionChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:createdCollection];
                // 将保存到【相机胶卷】的图片添加到【自定义相册】
                [collectionChangeRequest insertAssets:@[placeholder] atIndexes:[NSIndexSet indexSetWithIndex:0]];
                
            } completionHandler:handler];
        }
    }];
}
- (PHAssetCollection *)createdCollection{
    
    // 抓取所有【自定义相册】
    PHFetchResult<PHAssetCollection *> * collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    // 从Info.plist中获得App名称(也就是当前App的相册名称)
    NSString *title = [NSBundle mainBundle].infoDictionary[(NSString *)kCFBundleNameKey];
    
    for (PHAssetCollection * collection in collections) {
        
        if ([collection.localizedTitle isEqualToString:title]) {
            // 【自定义相册】已经创建过
            return collection;
        }
    }
    __block PHObjectPlaceholder * placeholder = nil;
    // 同步执行操作
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        
        // 创建【自定义相册】
        placeholder = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title].placeholderForCreatedAssetCollection;
        
    } error:nil];
    // 根据id获得刚刚创建完的相册
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[placeholder.localIdentifier] options:nil][0];
}
/** 校正拍摄图片是否被旋转 */
+ (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end
