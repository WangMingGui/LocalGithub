//
//  WMGCar.h
//  26-索引条
//
//  Created by 王明贵 on 2019/7/9.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMGCar : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *icon;

+(instancetype)carWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
