//
//  ViewController.m
//  demo
//
//  Created by 张银龙 on 2017/2/22.
//  Copyright © 2017年 张银龙. All rights reserved.
//

#import "ViewController.h"
#import "NSString+YLCategory.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = @"腾讯科技讯 2月15日，联合办公空间品牌梦想加空间宣布获得腾讯众创空间战略入股，同时与腾讯开放平台达成全面战略合作。此番携手后，梦想加智能办公体系将逐步应用至遍布全国超过10万平米腾讯众创空间，并实现对所有空间内会员流动数据、企业服务资源的整合管理。同时，双方合作还包括推动梦想加“OaaS（办公即服务）”体系输出落地，开发全国各地的联合办公空间。据介绍，梦想加在创立之初，就独立开发包括标准化空间设计、智能系统布局以及空间运营管理三条产品线，以“OaaS（办公即服务）”体系与物业持有方进行合作，整合输出。不到两年时间内，梦想加通过与龙湖地产、首开地产、金融街集团、朝外MEN、77文创园等不同业态合作，已在松榆里、天桥、雍和宫、中关村、望京、朝外、常营等北京核心商业区布局运营16个联合空间。目前，已累计有超过230家不同";
    
    
    NSAttributedString *attrStr = [string stringWithParagraphlineSpeace:8 textColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:17]];
    
    
    //_label.text = string;
    _label.attributedText = attrStr;
    
    
    CGFloat ff = [string heightParagraphSpeace:8 font:[UIFont systemFontOfSize:17] width:self.view.frame.size.width -20];
    NSLog(@"%@",@(ff));
}
/*
 stringWithParagraphlineSpeace
 NSMutableAttributedString *mutString = [[NSMutableAttributedString alloc] initWithString:contentStr];
 NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
 [paragraph setLineSpacing:8.0];
 [mutString addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, mutString.length)];
 [mutString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} range:NSMakeRange(0, mutString.length)];
 [_descTextView setAttributedText:mutString];
 
 
 */


@end
