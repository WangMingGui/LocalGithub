//
//  WMGWineCell.m
//  30-购物车01-
//
//  Created by 王明贵 on 2019/7/31.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import "WMGWineCell.h"
#import "WMGWine.h"
#import "WMGCirclrButton.h"

@interface WMGWineCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageimageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet WMGCirclrButton *remove;


@end
@implementation WMGWineCell

//设置数据
-(void)setWine:(WMGWine *)wine
{
    _wine = wine;
    
    self.imageimageView.image = [UIImage imageNamed:wine.image];
    self.nameLabel.text = wine.name;
    self.priceLabel.text = wine.price;
    
    //根据模型的count属性决定contLabel显示的文字
    self.countLabel.text = [NSString stringWithFormat:@"%d",wine.count];
    
    //根据n模型的count属性决定减号按钮是否可以点击
    self.remove.enabled = wine.count > 0;
}

/**加号点击*/
- (IBAction)add:(id)sender {
    //修改模型
    self.wine.count ++;

    //修改界面
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    //控制remove按钮是否可以点击
    self.remove.enabled = YES;
    
    //通知代理，调用代理的某个方法
    if ([self.delegate respondsToSelector:@selector(wineCellDidClickAddButton:)]) {
        [self.delegate wineCellDidClickAddButton:self];
    }
}
/**减号点击*/
- (IBAction)remove:(id)sender {
    //修改模型
    self.wine.count --;
    
    //修改界面
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    if (self.wine.count == 0) {
        self.remove.enabled = NO;
    }
    
    //通知代理，调用代理的某个方法
    if ([self.delegate respondsToSelector:@selector(wineCellDidClickRmoveButton:)]) {
        [self.delegate wineCellDidClickRmoveButton:self];
    }
    
}

@end
