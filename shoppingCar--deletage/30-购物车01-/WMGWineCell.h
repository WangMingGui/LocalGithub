//
//  WMGWineCell.h
//  30-购物车01-
//
//  Created by 王明贵 on 2019/7/31.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WMGWine,WMGWineCell;

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
@protocol WMGWineCellDelegate <NSObject,UIScrollViewDelegate>

@optional//代理方法可以实现也可以不实现

-(void)wineCellDidClickAddButton:(WMGWineCell *)wineCell;

-(void)wineCellDidClickRmoveButton:(WMGWineCell *)wineCell;

@end

@interface WMGWineCell : UITableViewCell
//模型属性
@property(nonatomic,strong)WMGWine *wine;
//代理属性
@property(nonatomic,weak)id <WMGWineCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
