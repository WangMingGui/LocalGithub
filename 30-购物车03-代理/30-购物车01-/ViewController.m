//
//  ViewController.m
//  30-购物车01-
//
//  Created by 王明贵 on 2019/7/31.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import "ViewController.h"
#import "WMGWineCell.h"
#import "MJExtension.h"
#import "WMGWine.h"

@interface ViewController ()<UITableViewDataSource,WMGWineCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

//所有模型的数组
@property(nonatomic,strong) NSArray *wines;
/**总价*/
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;

@property (strong,nonatomic) NSMutableArray *shoppingCar;
@end

@implementation ViewController

-(NSArray *)wines
{
    if (!_wines) {
        _wines = [WMGWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wines;
}

- (NSMutableArray *)shoppingCar
{
    if (!_shoppingCar ) {
        _shoppingCar = [NSMutableArray array];
        
    }
    return _shoppingCar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    
}

//清空购物车
- (IBAction)clean {
    //购买数量清0
    for (WMGWine *wine in self.shoppingCar) {
        wine.count = 0;
    }
    //控制购买按钮状态
    self.buyButton.enabled = NO;
    //刷新表格
    [self.tableView reloadData];
    
    //总价清0
    self.totalPriceLabel.text = @"0";
    
    //清空购物车
    [self.shoppingCar removeAllObjects];
}
//打印购买商品
- (IBAction)buy {
    
    for (WMGWine *wine in self.shoppingCar) {
        double price = wine.count * wine.price.intValue;
        NSLog(@"够买了%d件%@,话费了%.2f",wine.count,wine.name,price);
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wines.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"wine";
    //访问缓存池
    WMGWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //传递数据
    cell.wine = self.wines[indexPath.row];
    //设置代理
    cell.delegate = self;
    
    return cell;
}

#pragma mark - WMGWineCellDelegate
-(void)wineCellDidClickAddButton:(WMGWineCell *)wineCell
{
    //计算总价
    int totalPrice = self.totalPriceLabel.text.intValue + wineCell.wine.price.intValue;
    //设置总价
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d",totalPrice];
    //控制按钮状态
    self.buyButton.enabled = YES;
    //之前没有添加过，才添加
    if(![self.shoppingCar containsObject:wineCell.wine]){
        [self.shoppingCar addObject:wineCell.wine];
    }
}

-(void)wineCellDidClickRmoveButton:(WMGWineCell *)wineCell
{
    //计算总价
    int totalPrice = self.totalPriceLabel.text.intValue - wineCell.wine.price.intValue;
    //设置总价
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d",totalPrice];
    //控制按钮状态
    self.buyButton.enabled = totalPrice > 0;
    
    if (wineCell.wine.count <= 0) {
        [self.shoppingCar removeObject:wineCell.wine];
    }
}
@end
