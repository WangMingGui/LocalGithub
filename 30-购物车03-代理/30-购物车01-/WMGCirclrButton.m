//
//  WMGCirclrButton.m
//  30-购物车01-
//
//  Created by 王明贵 on 2019/7/31.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import "WMGCirclrButton.h"

@implementation WMGCirclrButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [super awakeFromNib];
    //设置边框宽度
    self.layer.borderWidth = 1;
    //设置边框颜色
    self.layer.borderColor = [UIColor orangeColor].CGColor;
    //设置圆角半径
    self.layer.cornerRadius = (self.frame.size.width) * 0.5;
    
}
@end
