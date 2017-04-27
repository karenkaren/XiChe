//
//  ShopOrderModel.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/26.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "ShopOrderModel.h"

@implementation ShopOrderModel

+ (void)submitShopOrder:(NSDictionary *)params shopServices:(NSArray<ShopServiceModel *> *)shopServices block:(APIResultDataBlock)block
{
    NSMutableArray * reserveProductList = [NSMutableArray arrayWithCapacity:shopServices.count];
    for (ShopServiceModel * shopService in shopServices) {
        NSDictionary * serviceDic = @{@"serviceId" : @(shopService.serviceId), @"serviceName" : esString(shopService.serviceName)};
        [reserveProductList addObject:serviceDic];
    }

    [[NetAPIManager sharedNetAPIManager] customRequestWithPath:kShopReserveAdd params:params body:@{@"reserveProductList" : reserveProductList} methodType:Post autoShowError:YES block:^(id response, NSError *error) {
        id data = nil;
        if (!error) {
            BaseDto * dto = [BaseDto mj_objectWithKeyValues:response];
            data = dto.data;
        }
        if (block) {
            block(response, data, error);
        }
    }];
}

@end
