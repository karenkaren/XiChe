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

+ (void)addCar:(NSDictionary *)params block:(APIResultBlock)block;

@end
