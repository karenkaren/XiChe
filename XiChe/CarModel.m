//
//  CarModel.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/14.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

+ (void)addCar:(NSDictionary *)params block:(APIResultBlock)block
{
    [[NetAPIManager sharedNetAPIManager] requestWithPath:kUserAddCar params:params methodType:Get block:^(id response, NSError *error) {
        if (block) {
            block(response, error);
        }
    }];
}

+ (void)getCarList:(NSDictionary *)params block:(APIResultDataBlock)block
{
//    [NetAPIManager sharedNetAPIManager] requestWithPath:<#(NSString *)#> params:<#(NSDictionary *)#> methodType:<#(NetworkMethod)#> block:<#^(id response, NSError *error)block#>
}

@end
