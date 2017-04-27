//
//  CarSerieListController.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/24.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "CarSeriesListController.h"
#import "CarSeriesModel.h"
#import "UIImageView+WebCache.h"

@interface CarSeriesListController ()

@property (nonatomic, strong) NSArray * originalData;
@property (nonatomic, strong) CarModel * carBrand;

@end

@implementation CarSeriesListController

- (instancetype)initWithCar:(CarModel *)car
{
    self = [super init];
    if (self) {
        self.carBrand = car;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.title = [NSString stringWithFormat:@"品牌id:%ld", self.carBrand.ID];
    
    self.tableView.height += kTabBarHeight;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CarCell"];
    
    [self getOriginalData];
}

- (void)getOriginalData
{
    [CarSeriesModel getCarSeriesListWithCarId:self.carBrand.ID block:^(id response, id data, NSError *error) {
        if (data && isArray(data)) {
            self.originalData = data;
            [self.tableView reloadData];
        }
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 1.取出对应的组
    CarSeriesModel * carSeries = self.originalData[section];
    // 2.返回对应组的行数
    return carSeries.serieslist.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"car";
    
    // 1.取缓存池中找cell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // 2.设置数据
    // 2.1获取对应的组
    CarSeriesModel * carSeries = self.originalData[indexPath.section];
    
    // 2.2获取对应的行
    CarModel * car = carSeries.serieslist[indexPath.row];
    
    // 2.3赋值
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:car.imgurl] placeholderImage:[UIImage imageNamed:@"m_3_100"] options:SDWebImageRetryFailed];
    cell.textLabel.text = car.name;
    
    // 3.返回cell
    return cell;
}

//#pragma mark - 返回索引(数据源方法系统自动调用)
//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    NSArray * titles = [self.originalData valueForKeyPath:@"letter"];
//    return titles;
//}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    // 1.取出对应的组
//    CarBrandModel * carGroup = self.originalData[section];
//    
//    // 2.返回对应组的标题
//    return carGroup.letter;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarSeriesModel * carSeries = self.originalData[indexPath.section];
    CarModel * car = carSeries.serieslist[indexPath.row];
    NSString * brand = car.name;
    NSString * brandtype = self.carBrand.name;
    NSString * carType = car.levelname;
    DLog(@"brandtype:%@ brand:%@ carType:%@", brandtype, brand, carType);
    
    NSDictionary * params = @{@"brand" : brand, @"brandtype" : brandtype, @"carType" : carType};
    [CarModel addCar:params block:^(id response, NSError *error) {
        if (!error) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
}

@end
