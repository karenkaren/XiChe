//
//  CarSeriesListController.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/24.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseTableViewController.h"

@interface CarSeriesListController : BaseTableViewController

@property (nonatomic, assign) NSInteger carBrandId;

- (instancetype)initWithCarBrandId:(NSInteger)carBrandId;

@end
