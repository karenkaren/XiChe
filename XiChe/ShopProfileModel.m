//
//  ShopProfileModel.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/6.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "ShopProfileModel.h"

@implementation ShopProfileModel

+ (void)getShopList:(NSDictionary *)params block:(void (^)(id, NSArray *, NSError *))block
{
    // todo:test
    NSMutableArray * shopList = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i < 20; i++) {
        ShopProfileModel * shopProfile = [[ShopProfileModel alloc] init];
        // 洗车店简介图片
        shopProfile.shopImage = [UIImage imageNamed:[NSString stringWithFormat:@"welcome_image_%d", i % 4]];
        // 洗车店名称
        shopProfile.shopName = [NSString stringWithFormat:@"麦麦洗车店%d", i];
        // 洗车店星级
        shopProfile.shopStars = i % 5;
        // 洗车店地址
        shopProfile.shopAddress = [NSString stringWithFormat:@"黄浦区龙华东路%d号", 868 + i];
        // 正在洗车数
        shopProfile.washingCount = i;
        // 排队人数
        shopProfile.queueingCount = 20 - i;
        // 等候时间
        shopProfile.waitingTime = arc4random_uniform(50) * 1.0f / 10;
        // 优惠信息
        shopProfile.preferentialInfo = @"周二上午8:00～12:00八折洗车";
        [shopList addObject:shopProfile];
    }
    if (block) {
        block(nil, shopList, nil);
    }
}

@end
