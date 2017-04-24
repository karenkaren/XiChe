//
//  CarSeriesModel.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/24.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "CarSeriesModel.h"

@implementation CarSeriesModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"serieslist" : [CarModel class]};
}

+ (void)getCarSeriesListWithCarId:(NSInteger)carId block:(APIResultDataBlock)block
{
    NSString * path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/cars/seriesprice-pm1-b%ld-t2.json", carId];
    [[NetAPIManager sharedNetAPIManager] requestWithPath:path params:nil methodType:Get block:^(id response, NSError *error) {
        id data = nil;
        if (!error) {
            NSArray * brandList = response[@"result"][@"fctlist"];
            data = [CarSeriesModel mj_objectArrayWithKeyValuesArray:brandList];
        }
        if (block) {
            block(response, data, error);
        }
    }];
}

@end
