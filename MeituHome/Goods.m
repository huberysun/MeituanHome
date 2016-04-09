//
//  Goods.m
//  TableViewUsing
//
//  Created by HuberySun on 16/4/7.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import "Goods.h"

@implementation Goods

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic
         ];
    }
    return self;
}

+ (instancetype)goodsWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}
@end
