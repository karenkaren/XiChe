//
//  HomeRootController.m
//  XiChe
//
//  Created by LiuFeifei on 17/4/2.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "HomeRootController.h"
#import "HomeRootHeaderView.h"
#import "ShopProfileCell.h"
#import "HomeModel.h"

@interface HomeRootController ()<BMKLocationServiceDelegate>

@property (nonatomic, strong) HomeRootHeaderView * homeRootHeaderView;
@property (nonatomic, strong) NSArray<ShopProfileModel *> * shopList;
@property (nonatomic, strong) BMKLocationService * locService;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end

@implementation HomeRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    self.coordinate = CLLocationCoordinate2DMake(39.915, 116.404);
    
    self.homeRootHeaderView = [[HomeRootHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    self.tableView.tableHeaderView = self.homeRootHeaderView;
    
    [self.tableView registerClass:[ShopProfileCell class] forCellReuseIdentifier:@"Cell"];
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];

}

- (void)getHomeDataWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSDictionary * dic = @{@"latitude" : @(coordinate.latitude), @"longitude" : @(coordinate.longitude)};
    [HomeModel getHomeInfo:dic block:^(id response, id data, NSError *error) {
        if (data) {
            HomeModel * homeModel = (HomeModel *)data;
            [self.homeRootHeaderView refreshHeaderViewWithBanners:homeModel.bannersList];
            self.shopList = homeModel.shopList;
            [self.tableView reloadData];
        }
    }];
}

//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    [self getHomeDataWithCoordinate:userLocation.location.coordinate];
    [_locService stopUserLocationService];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shopList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopProfileCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.shopProfile = self.shopList[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    ShopProfileCell * cell = (ShopProfileCell *)[tableView cellForRowAtIndexPath:indexPath];
    //    return [cell getAutoCellHeight];
    return 210;
}

@end
