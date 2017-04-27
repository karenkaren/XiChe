//
//  ShopServiceModel.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/24.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "ShopServiceModel.h"

@implementation ShopServiceModel

+ (void)getShopServices:(NSDictionary *)params block:(APIResultDataBlock)block
{
    [[NetAPIManager sharedNetAPIManager] requestWithPath:kShopProductList params:params methodType:Get block:^(id response, NSError *error) {
        id data = nil;
        if (!error) {
            BaseDto * dto = [BaseDto mj_objectWithKeyValues:response];
            NSArray * shopServices = [ShopServiceModel mj_objectArrayWithKeyValuesArray:dto.data[@"list"]];
            data = shopServices;
        }
        if (block) {
            block(response, data, error);
        }
    }];
}

@end
