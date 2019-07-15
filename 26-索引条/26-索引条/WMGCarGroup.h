//
//  WMGCarGroup.h
//  26-索引条
//
//  Created by 王明贵 on 2019/7/9.
//  Copyright © 2019 王明贵. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface WMGCarGroup : NSObject

@property(nonatomic,copy) NSString *title;

@property(nonatomic,strong) NSArray *cars;

+(instancetype)carGroupWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
