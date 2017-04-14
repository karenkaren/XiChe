//
//  CarGroupModel.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/14.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "CarGroupModel.h"

@implementation CarGroupModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"cars" : [CarModel class]};
}

+ (NSArray *)getCarGroupList
{
    NSString * fullPath = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
    NSArray * dictArray = [NSArray arrayWithContentsOfFile:fullPath];
    return [CarGroupModel mj_objectArrayWithKeyValuesArray:dictArray];
}

@end
