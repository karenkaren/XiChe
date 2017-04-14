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

@interface HomeRootController ()

@property (nonatomic, strong) HomeRootHeaderView * homeRootHeaderView;
@property (nonatomic, strong) ShopProfileModel * shopProfile;

@end

@implementation HomeRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    self.homeRootHeaderView = [[HomeRootHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    self.tableView.tableHeaderView = self.homeRootHeaderView;
    
    [self.tableView registerClass:[ShopProfileCell class] forCellReuseIdentifier:@"Cell"];
    
    kWeakSelf
    [ShopProfileModel getShopList:nil block:^(id response, NSArray *shopList, NSError *error) {
        if (!error) {
            kStrongSelf
            strongSelf.shopProfile = shopList.firstObject;
            [strongSelf.tableView reloadData];
        }
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger number = self.shopProfile ? 1 : 0;
    return number;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopProfileCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.shopProfile = self.shopProfile;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    ShopProfileCell * cell = (ShopProfileCell *)[tableView cellForRowAtIndexPath:indexPath];
    //    return [cell getAutoCellHeight];
    return 200;
}

@end
