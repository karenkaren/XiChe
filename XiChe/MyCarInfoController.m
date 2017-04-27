//
//  MyCarInfoController.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/9.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "MyCarInfoController.h"
#import "MyCarInfoCell.h"
#import "CarBrandListController.h"
#import "CarModel.h"

#define kMyCarInfoCell @"MyCarInfoCell"

@interface MyCarInfoController ()

@property (nonatomic, strong) NSMutableArray * myCarList;
@property (nonatomic, strong) UIButton * addCarButton;

@end

@implementation MyCarInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.addCarButton = [UIButton createButtonWithTitle:@"添加爱车" color:[UIColor redColor] font:kFont(30) block:^(UIButton *button) {
        CarBrandListController * carBrandListController = [[CarBrandListController alloc] init];
        carBrandListController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:carBrandListController animated:YES];
    }];
    self.addCarButton.center = self.view.center;
    [self.view addSubview:self.addCarButton];
    
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
    kWeakSelf
    [CarModel getCarList:params block:^(id response, NSArray * carList, NSInteger totalCount, NSError *error) {
        kStrongSelf
        [strongSelf.tableView.mj_header endRefreshing];
        [strongSelf.tableView.mj_footer endRefreshing];
        if (carList && totalCount) {
            self.addCarButton.hidden = YES;
            strongSelf.totalCount = totalCount;
            [strongSelf.myCarList addObjectsFromArray:carList];
            [strongSelf.tableView reloadData];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myCarList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCarInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:kMyCarInfoCell forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    CarModel * car = self.myCarList[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ %@", car.brand, car.carNo, car.carType];
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
