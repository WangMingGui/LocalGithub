//
//  WMGCar.m
//  26-索引条
//
//  Created by 王明贵 on 2019/7/9.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import "WMGCar.h"

@implementation WMGCar

+(instancetype)carWithDict:(NSDictionary *)dict
{
    WMGCar *car = [[WMGCar alloc]init];
    [car setValuesForKeysWithDictionary:dict];
    return car;
}
@end
