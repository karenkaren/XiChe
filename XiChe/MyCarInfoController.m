//
//  MyCarInfoController.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/9.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "MyCarInfoController.h"
#import "MyCarInfoCell.h"

#define kMyCarInfoCell @"MyCarInfoCell"

@interface MyCarInfoController ()

@property (nonatomic, strong) NSMutableArray * myCarList;

@end

@implementation MyCarInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[MyCarInfoCell class] forCellReuseIdentifier:kMyCarInfoCell];
    
    self.myCarList = [NSMutableArray array];
    
    // 下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = 0;
        [self getMyCarList];
    }];
    
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage++;
        [self getMyCarList];
    }];
    
    [self.tableView.mj_header beginRefreshing];
    
}

- (void)getMyCarList
{
    if (self.currentPage == 0) {
        [self.myCarList removeAllObjects];
    } else {
        if (self.currentPage * self.pageSize >= self.totalCount) {
            [self.tableView.mj_footer endRefreshing];
            return;
        }
    }
    
    NSDictionary * params = @{@"currentPage" : @(self.currentPage), @"pageSize" : @(self.pageSize)};
//    kWeakSelf
//    [ShopProfileModel getShopList:params block:^(id response, NSArray *shopList, NSInteger totalCount, NSError *error) {
//        kStrongSelf
//        [strongSelf.tableView.mj_header endRefreshing];
//        [strongSelf.tableView.mj_footer endRefreshing];
//        if (shopList && totalCount) {
//            strongSelf.totalCount = totalCount;
//            [strongSelf.shopList addObjectsFromArray:shopList];
//            [strongSelf.tableView reloadData];
//        }
//    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myCarList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCarInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:kMyCarInfoCell forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.shopProfile = self.myCarList[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    ShopProfileCell * cell = (ShopProfileCell *)[tableView cellForRowAtIndexPath:indexPath];
    //    return [cell getAutoCellHeight];
    return 210;
}

@end
