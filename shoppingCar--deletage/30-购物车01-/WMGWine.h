//
//  WMGWine.h
//  30-购物车01-
//
//  Created by 王明贵 on 2019/7/31.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMGWine : NSObject
/**商品名*/
@property(nonatomic,copy)NSString *name;
/**图片*/
@property(nonatomic,copy)NSString *image;
/**价格*/
@property(nonatomic,copy)NSString *price;
/**记录购买的个数*/
@property(nonatomic,assign)int count;

@end

NS_ASSUME_NONNULL_END
