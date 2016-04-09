//
//  ViewController.m
//  TableViewUsing
//
//  Created by HuberySun on 16/4/7.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import "ViewController.h"
#import "Goods.h"
#import "GoodsTableViewCell.h"
#import "FooterView.h"

@interface ViewController ()<UITableViewDataSource, FootViewDelegate>
@property(nonatomic, strong)NSMutableArray *products;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

//数据加载
- (NSMutableArray *)products{
    if (!_products) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *arr=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mutableArr=[NSMutableArray array];
        for (NSDictionary *dic in arr) {
            Goods *goods=[Goods goodsWithDic:dic];
            [mutableArr addObject:goods];
        }
        _products=mutableArr;
    }
    return _products;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource=self;
    self.tableView.rowHeight=70;
    FooterView *footerView=[FooterView footerView];
    footerView.delegate=self;
    self.tableView.tableFooterView=footerView;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.products.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取数据
    Goods *goods=[self.products objectAtIndex:indexPath.row];
    //创建单元格
    GoodsTableViewCell *cell=[GoodsTableViewCell goodsTableViewCellWithTableView:tableView];
    //设置单元格数据
    cell.goods=goods;
    //返回单元格
    return cell;
}


#pragma mark - FooterViewDelegate
- (void)footerViewDidTaped:(FooterView *)footerView{
    //
    [NSThread sleepForTimeInterval:2];
    
    NSLog(@"%@",[NSThread currentThread]);
    //创建新的数据
    Goods *newGoods=[[Goods alloc] init];
    newGoods.title=@"悟空酒吧";
    newGoods.price=@"100";
    newGoods.buyCount=@"1000";
    newGoods.icon=@"2010e3a0c7f88c3f5f5803bf66addd93.png";
    
    //添加新的数据到viewController的数据数组中
    [self.products addObject:newGoods];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
        //更新tableview
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:self.products.count-1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        //UITableView滚动到最后一行
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        //更新footerView
        footerView.btnLoad.hidden=NO;
        footerView.activityIndicator.hidden=YES;
//    });
    
}


@end
