//
//  ShopOrderModel.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/26.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseModel.h"
#import "ShopServiceModel.h"

@interface ShopOrderModel : BaseModel

+ (void)submitShopOrder:(NSDictionary *)params shopServices:(NSArray<ShopServiceModel *> *)shopServices block:(APIResultDataBlock)block;

@end
