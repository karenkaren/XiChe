//
//  HomeModel.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/21.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseModel.h"

@interface HomeModel : BaseModel

@property (nonatomic, strong) NSArray * bannersList;
@property (nonatomic, strong) NSArray * shopList;
@property (nonatomic, assign) BOOL isAllowShown;
@property (nonatomic, assign) BOOL isHasShown;

+ (void)getHomeInfo:(NSDictionary *)params block:(APIResultDataBlock)block;

@end
