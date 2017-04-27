//
//  CarModel.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/14.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

+ (void)addCar:(NSDictionary *)params block:(APIResultBlock)block
{
    [[NetAPIManager sharedNetAPIManager] requestWithPath:kUserAddCar params:params methodType:Get block:^(id response, NSError *error) {
        if (block) {
            block(response, error);
        }
    }];
}

+ (void)getCarList:(NSDictionary *)params block:(void (^)(id response, NSArray * carList, NSInteger totalCount, NSError *error))block
{
    [[NetAPIManager sharedNetAPIManager] requestWithPath:kUserCarList params:params methodType:Get block:^(id response, NSError *error) {
        NSArray * carList = nil;
        NSInteger totalCount = 0;
        if (!error) {
            BaseDto * dto = [BaseDto mj_objectWithKeyValues:response];
            carList = [CarModel mj_objectArrayWithKeyValuesArray:dto.data[@"list"]];
            totalCount = [dto.data[@"totalCount"] integerValue];
        }
        if (block) {
            block(response, carList, totalCount, nil);
        }
    }];
}

@end
