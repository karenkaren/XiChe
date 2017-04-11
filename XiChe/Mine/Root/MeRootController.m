//
//  MeRootController.m
//  LingTouNiaoLoan
//
//  Created by LiuFeifei on 16/12/29.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "MeRootController.h"
#import "MeRootHeaderView.h"

@interface MeRootController ()

@end

@implementation MeRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

    self.tableView.tableHeaderView = [[MeRootHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"haha";
    return cell;
}

@end
