//
//  FooterView.m
//  TableViewUsing
//
//  Created by HuberySun on 16/4/7.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView
+(instancetype)footerView{
    FooterView *view=(FooterView *)[[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil] lastObject];
    //view.activityIndicator.hidden=YES;
    return view;
}

- (IBAction)btnLoadClick:(id)sender {
    //隐藏btn，显示activity
    self.btnLoad.hidden=YES;
    self.activityIndicator.hidden=NO;
    
//    // 异步执行更新数据
    __weak typeof(self) weakSelf=self;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        if ([weakSelf.delegate respondsToSelector:@selector(footerViewDidTaped:)]) {
//            [weakSelf.delegate footerViewDidTaped:self];
//    }
//    });
    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//                if ([weakSelf.delegate respondsToSelector:@selector(footerViewDidTaped:)]) {
//                    [weakSelf.delegate footerViewDidTaped:self];
//            }
//
//    });
    
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                    if ([weakSelf.delegate respondsToSelector:@selector(footerViewDidTaped:)]) {
//                        [weakSelf.delegate footerViewDidTaped:self];
//                }
//    
//        });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if ([weakSelf.delegate respondsToSelector:@selector(footerViewDidTaped:)]) {
            [weakSelf.delegate footerViewDidTaped:self];
        }
    });
    
    //[NSThread sleepForTimeInterval:2];
}

@end
