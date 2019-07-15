//
//  WMGCarGroup.m
//  26-索引条
//
//  Created by 王明贵 on 2019/7/9.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import "WMGCarGroup.h"
#import "WMGCar.h"

@implementation WMGCarGroup

+ (instancetype)carGroupWithDict:(NSDictionary *)dict
{
    WMGCarGroup *group = [[WMGCarGroup alloc]init];
    group.title = dict[@"title"];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        WMGCar *car = [WMGCar carWithDict:carDict];
        [temp addObject:car];
    }
    group.cars = temp;
    
    
    return group;
}
@end
