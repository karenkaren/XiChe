//
//  CarBrandModel.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/14.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "CarBrandModel.h"

@implementation CarBrandModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"list" : [CarModel class]};
}

+ (void)getCarBrandList:(NSDictionary *)params block:(APIResultDataBlock)block
{
    [[NetAPIManager sharedNetAPIManager] requestWithPath:@"http://app.api.autohome.com.cn/autov4.7/cars/brands-pm1-ts0.json" params:nil methodType:Get block:^(id response, NSError *error) {
        id data = nil;
        if (!error) {
            NSArray * brandList = response[@"result"][@"brandlist"];
            data = [CarBrandModel mj_objectArrayWithKeyValuesArray:brandList];
        }
        if (block) {
            block(response, data, error);
        }
    }];
}

@end
