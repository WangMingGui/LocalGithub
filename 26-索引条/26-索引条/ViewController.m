//
//  ViewController.m
//  26-索引条
//
//  Created by 王明贵 on 2019/7/9.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import "ViewController.h"
#import "WMGCarGroup.h"
#import "WMGCar.h"

@interface ViewController ()

/**所有组模型*/
@property(nonatomic,strong) NSArray * carGroups;
@end

@implementation ViewController


-(NSArray *)carGroups
{
    if (_carGroups == nil) {
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"cars.plist" ofType:nil]];
        
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *groupDict in dictArray) {
            WMGCarGroup *group = [WMGCarGroup carGroupWithDict:groupDict];
            
            [temp addObject:group];
        }
        _carGroups = temp;
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.tableView registerNib:<#(nullable UINib *)#> forCellReuseIdentifier:<#(nonnull NSString *)#>]
    
    self.tableView.sectionIndexBackgroundColor = [UIColor yellowColor];
    self.tableView.sectionIndexColor = [UIColor redColor];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WMGCarGroup *group = self.carGroups[section];
    
    return group.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //0.定义重用标识
    static NSString *ID = @"car";
    //1.去缓存池取可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //2.如果缓存池没有则自己创建一个cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    //3.设置数据
    WMGCarGroup *group = self.carGroups[indexPath.section];
    WMGCar *car = group.cars[indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    //4.返回cell
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    WMGCarGroup *group = self.carGroups[section];
    return group.title;
}

//隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

//告诉tabelView右边显示的索引文字
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
//    NSMutableArray *temp = [NSMutableArray array];
//    for (WMGCarGroup *group in self.carGroups) {
//        [temp addObject:group.title];
//    }
//    return temp;
    
    //抽取self.carGroups这个数组中每一个对象的title属性的值，放在一个新的数组中返回
    return [self.carGroups valueForKeyPath:@"title"];
}
@end
