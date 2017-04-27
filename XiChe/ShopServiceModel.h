//
//  ShopServiceModel.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/24.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseModel.h"

@interface ShopServiceModel : BaseModel

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger carSize;
@property (nonatomic, copy) NSString * createTime;
// 原始价格
@property (nonatomic, assign) double originalPrice;
// 服务id
@property (nonatomic, assign) NSInteger serviceId;
// 服务名称
@property (nonatomic, copy) NSString * serviceName;
// 店铺id
@property (nonatomic, assign) NSInteger shopId;
// 消耗时间
@property (nonatomic, assign) NSInteger timeConsume;

+ (void)getShopServices:(NSDictionary *)params block:(APIResultDataBlock)block;

@end
