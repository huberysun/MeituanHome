//
//  Goods.h
//  TableViewUsing
//
//  Created by HuberySun on 16/4/7.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goods : NSObject
@property(nonatomic, copy)NSString *buyCount;
@property(nonatomic, copy)NSString *icon;
@property(nonatomic, copy)NSString *price;
@property(nonatomic, copy)NSString *title;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)goodsWithDic:(NSDictionary *)dic;
@end
