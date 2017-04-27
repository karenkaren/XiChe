//
//  ShopProfileModel.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/6.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseModel.h"

typedef NS_ENUM(NSUInteger, ShopSortType) {
    ShopSortTypeOfDefault, // 默认
    ShopSortTypeOfPrice,    // 根据价格排序
    ShopSortTypeOfWaitingTime,  // 根据等待时间排序
    ShopSortTypeOfDistance, // 根据距离排序
    ShopSortTypeOfEstimate  // 根据评价排序
};

@interface ShopProfileModel : BaseModel

// 洗车店简介图片
@property (nonatomic, strong) UIImage * shopImage;
// 洗车店名称
@property (nonatomic, copy) NSString * shopName;
// 洗车店星级
@property (nonatomic, assign) NSInteger rating;
// 洗车店地址
@property (nonatomic, copy) NSString * shopLocation;
// 正在洗车数
@property (nonatomic, assign) NSInteger worker;
// 排队人数
@property (nonatomic, assign) NSInteger washSpace;
// 等候时间
@property (nonatomic, assign) NSTimeInterval waitingTime;
// 洗车店id
@property (nonatomic, assign) NSInteger shopId;
// 距离
@property (nonatomic, assign) CGFloat distance;

// 优惠信息
@property (nonatomic, copy) NSString * preferentialInfo;
//
@property (nonatomic, assign) NSInteger status;
// 工作时间
@property (nonatomic, copy) NSString * workTime;
// 纬度
@property (nonatomic, assign) CLLocationDegrees latitude;
// 经度
@property (nonatomic, assign) CLLocationDegrees longitude;
// 联系电话
@property (nonatomic, copy) NSString * phone;

+ (void)getShopListWithSortType:(ShopSortType)shopSortType params:(NSDictionary *)params block:(void (^)(id response, NSArray * shopList, NSInteger totalCount, NSError *error))block;

@end
