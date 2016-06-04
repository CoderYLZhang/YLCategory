//
//  YLAlertTool.m
//  alertTool
//
//  Created by yinlong on 16/6/4.
//  Copyright © 2016年 yinlong. All rights reserved.
//

#import "YLAlertTool.h"

@implementation YLAlertTool

#pragma mark - 一个按钮
+ (void)showAlertWithTitle:(NSString *)title {
    
    [self showAlertWithTitle:title andContent:nil];
}

+ (void)showAlertWithTitle:(NSString *)title andContent:(NSString *)content {
    
    [self showAlertWithTitle:title andContent:content andDoAction:nil];
}

+ (void)showAlertWithTitle:(NSString *)title andContent:(NSString *)content andDoAction:(AlertBlock)doAction {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        if (doAction) {
            doAction();
        }
    }];
    [alert addAction:confirm];
    [self  presentViewController:alert];
}

#pragma mark - 两个按钮
+ (void)showChooseAlertWithTitle:(NSString *)title {
    
    [self showChooseAlertWithTitle:title andContent:nil];
}

+ (void)showChooseAlertWithTitle:(NSString *)title andContent:(NSString *)content {
    
    [self showChooseAlertWithTitle:title andContent:content andDoAction:nil];
}

+ (void)showChooseAlertWithTitle:(NSString *)title andContent:(NSString *)content andDoAction:(AlertBlock)doAction {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        if (doAction) {
            doAction();
        }
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
    
    [alert addAction:cancel];
    [alert addAction:confirm];
    
    [self  presentViewController:alert];
}

+ (void)presentViewController: (UIViewController*)vController {
    
    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [rootViewController presentViewController: vController  animated: YES completion: nil];
}

@end
