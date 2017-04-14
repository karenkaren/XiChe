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
 *  品牌图标
 */
@property (nonatomic, copy) NSString * icon;
/**
 *  品牌名称
 */
@property (nonatomic, copy) NSString * name;

@end
