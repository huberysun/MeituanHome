//
//  GoodsTableViewCell.m
//  TableViewUsing
//
//  Created by HuberySun on 16/4/7.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import "GoodsTableViewCell.h"
@interface GoodsTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblCount;

@end

@implementation GoodsTableViewCell

+ (instancetype)goodsTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *cellIdentifier=@"goodsCellIdentifier";
    GoodsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell=(GoodsTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"GoodsTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setGoods:(Goods *)goods{
    _goods=goods;
    
    self.imgViewIcon.image=[UIImage imageNamed:goods.icon];
    self.lblTitle.text=goods.title;
    self.lblPrice.text=goods.price;
    self.lblCount.text=goods.buyCount;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
