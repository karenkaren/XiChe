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

@property (nonatomic, strong) NSArray * shopList;

@end

@implementation ShopRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"洗车店";

    [self.tableView registerClass:[ShopProfileCell class] forCellReuseIdentifier:kShopProfileCell];
    
    kWeakSelf
    [ShopProfileModel getShopList:nil block:^(id response, NSArray *shopList, NSError *error) {
        kStrongSelf
        strongSelf.shopList = shopList;
        [strongSelf.tableView reloadData];
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
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopProfileCell * cell = (ShopProfileCell *)[tableView cellForRowAtIndexPath:indexPath];
    ShopDetailController * shopDetailController = [[ShopDetailController alloc] initWithShopProfile:cell.shopProfile];
    shopDetailController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shopDetailController animated:YES];
}

@end
