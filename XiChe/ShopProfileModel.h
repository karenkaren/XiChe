//
//  ShopProfileModel.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/6.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseModel.h"

@interface ShopProfileModel : BaseModel

// 洗车店简介图片
@property (nonatomic, strong) UIImage * shopImage;
// 洗车店名称
@property (nonatomic, copy) NSString * shopName;
// 洗车店星级
@property (nonatomic, assign) NSInteger shopStars;
// 洗车店地址
@property (nonatomic, copy) NSString * shopAddress;
// 正在洗车数
@property (nonatomic, assign) NSInteger washingCount;
// 排队人数
@property (nonatomic, assign) NSInteger queueingCount;
// 等候时间
@property (nonatomic, assign) NSTimeInterval waitingTime;
// 优惠信息
@property (nonatomic, copy) NSString * preferentialInfo;

+ (void)getShopList:(NSDictionary *)params block:(void (^)(id response, NSArray * shopList, NSError *error))block;

@end
