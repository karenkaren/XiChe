//
//  ShopProfileModel.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/6.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "ShopProfileModel.h"

@interface ShopProfileModel ()

@property (nonatomic, assign) ShopSortType shopSortType;

@end

@implementation ShopProfileModel

+ (void)getShopListWithSortType:(ShopSortType)shopSortType params:(NSDictionary *)params block:(void (^)(id, NSArray *, NSInteger, NSError *))block
{
    NSString * path = nil;
    switch (shopSortType) {
        case ShopSortTypeOfDefault:
            path = kShopListsDefault;
            break;
        case ShopSortTypeOfDistance:
            path = kShopListsWithDistance;
            break;
        default:
            path = kShopListsDefault;
            break;
    }
    
    [[NetAPIManager sharedNetAPIManager] requestWithPath:path params:params methodType:Get block:^(id response, NSError *error) {
        NSArray * shopList = nil;
        NSInteger totalCount = 0;
        if (!error) {
            BaseDto * dto = [BaseDto mj_objectWithKeyValues:response];
            shopList = [ShopProfileModel mj_objectArrayWithKeyValuesArray:dto.data[@"shopList"]];
            totalCount = [dto.data[@"totalCount"] integerValue];
        }
        if (block) {
            block(response, shopList, totalCount, nil);
        }
    }];
    
//    // todo:test
//    NSMutableArray * shopList = [NSMutableArray arrayWithCapacity:20];
//    for (int i = 0; i < 20; i++) {
//        ShopProfileModel * shopProfile = [[ShopProfileModel alloc] init];
//        // 洗车店简介图片
//        shopProfile.shopImage = [UIImage imageNamed:[NSString stringWithFormat:@"welcome_image_%d", i % 4]];
//        // 洗车店名称
//        shopProfile.shopName = [NSString stringWithFormat:@"麦麦洗车店%d", i];
//        // 洗车店星级
//        shopProfile.rating = i % 5;
//        // 洗车店地址
//        shopProfile.shopLocation = [NSString stringWithFormat:@"黄浦区龙华东路%d号", 868 + i];
//        // 正在洗车数
//        shopProfile.worker = i;
//        // 排队人数
//        shopProfile.washSpace = 20 - i;
//        // 等候时间
//        shopProfile.waitingTime = arc4random_uniform(50) * 1.0f / 10;
//        // 优惠信息
//        shopProfile.preferentialInfo = @"周二上午8:00～12:00八折洗车";
//        [shopList addObject:shopProfile];
//    }
//    if (block) {
//        block(nil, shopList, nil);
//    }
}

@end
