//
//  CarListController.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/14.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "CarListController.h"
#import "CarGroupModel.h"

@interface CarListController ()

@property (nonatomic, strong) NSArray * originalData;

@end

@implementation CarListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"请选择品牌";
    self.originalData = [CarGroupModel getCarGroupList];
    
    self.tableView.height += kTabBarHeight;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CarCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.originalData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 1.取出对应的组
    CarGroupModel * carGroup = self.originalData[section];
    // 2.返回对应组的行数
    return carGroup.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"car";
    
    // 1.取缓存池中找cell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    // 2.设置数据
    // 2.1获取对应的组
    CarGroupModel * carGroup = self.originalData[indexPath.section];
    
    // 2.2获取对应的行
    CarModel * car = carGroup.cars[indexPath.row];
    
    // 2.3赋值
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    // 3.返回cell
    return cell;
}

#pragma mark - 返回索引(数据源方法系统自动调用)
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray * titles = [self.originalData valueForKeyPath:@"title"];
    return titles;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 1.取出对应的组
    CarGroupModel * carGroup = self.originalData[section];
    
    // 2.返回对应组的标题
    return carGroup.title;
}

@end
