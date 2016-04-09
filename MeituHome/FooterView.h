//
//  FooterView.h
//  TableViewUsing
//
//  Created by HuberySun on 16/4/7.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FooterView;
@protocol FootViewDelegate<NSObject>
- (void)footerViewDidTaped:(FooterView *)footerView;
@end

@interface FooterView : UIView
@property (strong, nonatomic) IBOutlet UIButton *btnLoad;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

+ (instancetype)footerView;

@property(nonatomic, weak)id<FootViewDelegate> delegate;
@end
