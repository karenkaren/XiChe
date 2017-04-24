//
//  CarSeriesModel.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/24.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseModel.h"
#import "CarModel.h"

@interface CarSeriesModel : BaseModel

@property (nonatomic, copy) NSString * name;
@property (nonatomic, strong) NSArray * serieslist;

+ (void)getCarSeriesListWithCarId:(NSInteger)carId block:(APIResultDataBlock)block;

@end
