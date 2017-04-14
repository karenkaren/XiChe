//
//  CarGroupModel.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/14.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseModel.h"
#import "CarModel.h"

@interface CarGroupModel : BaseModel

/**
 *  分组标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  每一组中的汽车数据(存储的是汽车的模型)
 */
@property (nonatomic, strong) NSArray *cars;

+ (NSArray *)getCarGroupList;

@end
