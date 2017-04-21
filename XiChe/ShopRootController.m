//
//  ShopRootController.m
//  XiChe
//
//  Created by LiuFeifei on 17/4/2.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "ShopRootController.h"
#import "ShopProfileModel.h"
#import "ShopProfileCell.h"
#import "ShopDetailController.h"

#define kShopProfileCell @"ShopProfileCell"

@interface ShopRootController ()

@property (nonatomic, strong) NSMutableArray * shopList;

@end

@implementation ShopRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"洗车店";

    [self.tableView registerClass:[ShopProfileCell class] forCellReuseIdentifier:kShopProfileCell];
    
    self.shopList = [NSMutableArray array];
    
    // 下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = 0;
        [self getShopList];
    }];
    
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage++;
        [self getShopList];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)getShopList
{
    if (self.currentPage == 0) {
        [self.shopList removeAllObjects];
    } else {
        if (self.currentPage * self.pageSize >= self.totalCount) {
            [self.tableView.mj_footer endRefreshing];
            return;
        }
    }
    
    NSDictionary * params = @{@"currentPage" : @(self.currentPage), @"pageSize" : @(self.pageSize)};
    kWeakSelf
    [ShopProfileModel getShopList:params block:^(id response, NSArray *shopList, NSInteger totalCount, NSError *error) {
        kStrongSelf
        [strongSelf.tableView.mj_header endRefreshing];
        [strongSelf.tableView.mj_footer endRefreshing];
        if (shopList && totalCount) {
            strongSelf.totalCount = totalCount;
            [strongSelf.shopList addObjectsFromArray:shopList];
            [strongSelf.tableView reloadData];
        }
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shopList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopProfileCell * cell = [tableView dequeueReusableCellWithIdentifier:kShopProfileCell forIndexPath:indexPath];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopProfileCell * cell = (ShopProfileCell *)[tableView cellForRowAtIndexPath:indexPath];
    ShopDetailController * shopDetailController = [[ShopDetailController alloc] initWithShopProfile:cell.shopProfile];
    shopDetailController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shopDetailController animated:YES];
}

@end
