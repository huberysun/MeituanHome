//
//  GoodsTableViewCell.h
//  TableViewUsing
//
//  Created by HuberySun on 16/4/7.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goods.h"
@interface GoodsTableViewCell : UITableViewCell
+ (instancetype)goodsTableViewCellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong)Goods *goods;
@end
