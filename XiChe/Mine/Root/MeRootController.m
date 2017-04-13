//
//  MeRootController.m
//  LingTouNiaoLoan
//
//  Created by LiuFeifei on 16/12/29.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "MeRootController.h"
#import "MeRootHeaderView.h"
#import "MyOrderCell.h"

@interface MeRootController ()

@property (nonatomic, strong) MeRootHeaderView * tableHeaderView;
@property (nonatomic, strong) NSArray * originalDatas;

@end

@implementation MeRootController

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self.tableHeaderView layoutIfNeeded];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    
    [self createTableViewWithStyle:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"NormalCell"];
    [self.tableView registerClass:[MyOrderCell class] forCellReuseIdentifier:@"MyOrderCell"];

    self.tableHeaderView = [[MeRootHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    self.tableView.tableHeaderView = self.tableHeaderView;
//    [self.view layoutIfNeeded];
    
    self.originalDatas = @[@[@"待确认", @"待服务", @"待评价", @"已完成"], @[@"洗车券", @"账户设置"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.originalDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return [self.originalDatas[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = nil;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"MyOrderCell" forIndexPath:indexPath];
//        cell.textLabel.text = @"订单";
        MyOrderCell * myOrderCell = (MyOrderCell *)cell;
        myOrderCell.datas = @[@"待确认", @"待服务", @"待评价", @"已完成"];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"NormalCell" forIndexPath:indexPath];
        cell.textLabel.text = self.originalDatas[indexPath.section][indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 88;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

@end
