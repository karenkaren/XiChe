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

//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
//{
//    self = [super init];
//    if (self) {
//        [self createTableViewWithFrame:frame style:style];
//    }
//    return self;
//}

- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (!self.tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:frame style:style];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTableViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight - kTabBarHeight - kStatusBarHeight) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
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
