//
//  BaseTableViewController.m
//  XiChe
//
//  Created by LiuFeifei on 17/4/2.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    [self.tableView removeFromSuperview];
    self.tableView = nil;
    self.tableView = [[UITableView alloc] initWithFrame:frame style:style];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)createTableViewWithStyle:(UITableViewStyle)style
{
    [self.tableView removeFromSuperview];
    self.tableView = nil;

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight - kTabBarHeight - kStatusBarHeight) style:style];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableViewWithStyle:UITableViewStylePlain];
    self.pageSize = 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
