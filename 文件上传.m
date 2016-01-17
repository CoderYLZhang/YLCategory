//
//  ViewController.m
//  06-掌握-NSURLConnection实现文件上传
//
//  Created by 张银龙 on 14/1/17.
//  Copyright © 2014年 张银龙. All rights reserved.
//

//文件上传步骤
//01 修改请求方法为POST
//02 设置请求头信息,告知服务器这是一个文件上传
    //Content-Type:multipart/form-data; boundary=----WebKitFormBoundaryyadprzBVdfHIhqXJ
//03 设置请求体(有固定格式)
    //分隔符:----WebKitFormBoundaryyadprzBVdfHIhqXJ
    //1)拼接文件参数
    /*
     --分隔符
     Content-Disposition: form-data; name="file"; filename="Snip20160117_798.png"
     Content-Type: image/png
     空行
     文件参数
     */
    //2)拼接非文件参数
    /*
     --分隔符
     Content-Disposition: form-data; name="username"
     空行
     xiaomage
     */
    //3)结尾标识
    /*
     --分隔符--
     */
/*
 ------WebKitFormBoundaryyadprzBVdfHIhqXJ
 Content-Disposition: form-data; name="file"; filename="Snip20160117_798.png"
 Content-Type: image/png
 
 文件参数
 ------WebKitFormBoundaryyadprzBVdfHIhqXJ
 Content-Disposition: form-data; name="username"
 
 xiaomage
 ------WebKitFormBoundaryyadprzBVdfHIhqXJ--
 */

#import "ViewController.h"
#define Kboundary @"----WebKitFormBoundaryyadprzBVdfHIhqXJ"
#define KNewLine [@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]
@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self upload];
}

-(void)upload
{
    //1.确定请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/upload"];
    
    //2.创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //3.修改请求方法为POST
    request.HTTPMethod = @"POST";
    
    //4.设置请求头信息
    //Content-Type:multipart/form-data; boundary=----WebKitFormBoundaryyadprzBVdfHIhqXJ
    NSString *header =[NSString stringWithFormat:@"multipart/form-data; boundary=%@",Kboundary];
    [request setValue:header forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *fileData = [NSMutableData data];
    //5.1拼接文件参数
    /*
     --分隔符
     Content-Disposition: form-data; name="file"; filename="Snip20160117_798.png"
     Content-Type: image/png
     空行
     文件参数
     */
    [fileData appendData:[[NSString stringWithFormat:@"--%@",Kboundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    
    //name:参数名称---file 规定的
    //filename:上传到服务器之后以什么名称来保存
    NSString *strM =@"Content-Disposition: form-data; name=\"file\"; filename=\"123.png\"";
    [fileData appendData:[strM dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    //Content-Type:文件的数据类型
    [fileData appendData:[@"Content-Type: image/png" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    [fileData appendData:KNewLine];
    
    UIImage *image = [UIImage imageNamed:@"Snip20160117_798"];
    NSData *imageData = UIImagePNGRepresentation(image);
    [fileData appendData:imageData];
    [fileData appendData:KNewLine];
    
    //5.2拼接非文件参数
    /*
     --分隔符
     Content-Disposition: form-data; name="username"
     空行
     xiaomage
     */
    
    [fileData appendData:[[NSString stringWithFormat:@"--%@",Kboundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    //name:参数名称username(规定的)
    [fileData appendData:[@"Content-Disposition: form-data; name=\"username\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    [fileData appendData:KNewLine];
    [fileData appendData:[@"xiaomage" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    
    //5.3 结尾标识
    /*
     --分隔符--
     */
    [fileData appendData:[[NSString stringWithFormat:@"--%@--",Kboundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //6.设置请求体
    request.HTTPBody = fileData;
    
    //7.发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
       
        //8.解析数据
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    
}

@end
