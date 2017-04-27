//
//  CarModel.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/14.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseModel.h"

@interface CarModel : BaseModel

/**
 *  id
 */
@property (nonatomic, assign) NSInteger ID;
/**
 *  图标
 */
@property (nonatomic, copy) NSString * imgurl;
/**
 *  名称
 */
@property (nonatomic, copy) NSString * name;
/**
 *  等级
 */
@property (nonatomic, assign) NSInteger levelid;
/**
 *  等级名称
 */
@property (nonatomic, copy) NSString * levelname;
/**
 *  售价
 */
@property (nonatomic, copy) NSString * price;


/////////////////////
@property (nonatomic, copy) NSString * brand;
@property (nonatomic, copy) NSString * carNo;
@property (nonatomic, copy) NSString * carType;

+ (void)addCar:(NSDictionary *)params block:(APIResultBlock)block;
+ (void)getCarList:(NSDictionary *)params block:(void (^)(id response, NSArray * carList, NSInteger totalCount, NSError *error))block;

@end
