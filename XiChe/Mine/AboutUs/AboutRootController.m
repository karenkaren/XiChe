//
//  AboutRootController.m
//  LingTouNiaoZF
//
//  Created by LiuFeifei on 16/11/24.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "AboutRootController.h"
#import "BaseWebViewController.h"
#import "NetAddressSettingController.h"

@interface AboutRootController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * OriginalData;

@end

@implementation AboutRootController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.baseNavigationController setNavigationBarHidden:NO animated:YES];
    self.baseNavigationController.barBackgroundColor = kWhiteColor;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"关于我们";
    [self.baseNavigationController hideBorder:NO];
    [self showCloseButton];
    [self initTableView];
    [self initHeader];
    [self initData];
}

- (void)initHeader
{
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 148)];
    
    UIImageView * logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    logoImageView.top = 32;
    logoImageView.centerX = headerView.myCenterX;
    logoImageView.layer.cornerRadius = 9;
    logoImageView.layer.masksToBounds = YES;
    [headerView addSubview:logoImageView];
    
    UILabel * versionLabel = [UILabel createLabelWithText:[NSString stringWithFormat:@"花无忧V%@", [GlobalManager appVersion]] font:kFont14 color:kTextColor];
    versionLabel.top = logoImageView.bottom + 12;
    versionLabel.centerX = logoImageView.centerX;
    [headerView addSubview:versionLabel];
    self.tableView.tableHeaderView = headerView;
}

- (void)initData
{
    NSMutableArray * arrayM = [NSMutableArray array];
    NSArray * array = @[
                        @{
                            @"title" : @"官方网站",
                            @"image" : @"icon_about_official_website",
                            @"sel" : @"goToWebPage:",
                            @"detail" : @"www.lingtouniao.com"
                            },
                        @{
                            @"title" : @"官方微信",
                            @"image" : @"icon_about_official_weixin",
                            @"sel" : @"",
                            @"detail" : @"花无忧借款"
                            },
                        @{
                            @"title" : @"关于花无忧",
                            @"image" : @"icon_about_app",
                            @"sel" : @"goToIntroductPage",
                            @"detail" : @""
                            }
                          ];
    [arrayM addObjectsFromArray:array];
    
#if (defined(ADHOC) || defined(DEBUG))
    
    NSDictionary * dic = @{
                           @"title" : @"设置服务器",
                           @"image" : @"icon_about_app",
                           @"sel" : @"setServer",
                           @"detail" : @""
                           };
    [arrayM addObject:dic];
    
#endif
    
    self.OriginalData = arrayM;

}

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = kWhiteColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = kHexColor(0xcccccc);
    self.tableView.sectionFooterHeight = 0;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    return self.OriginalData.count;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.OriginalData[section] count];
    return self.OriginalData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * CellIdentifier = NSStringFromClass([self class]);
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        
        cell.textLabel.font = kFont(16);
        cell.textLabel.textColor = kHexColor(0x3a3a3a);
        cell.detailTextLabel.font = kFont(14);
        cell.detailTextLabel.textColor = kHexColor(0x8a8a8a);
    }
    
    NSDictionary * descriptionDic = self.OriginalData[indexPath.row];
    cell.textLabel.text = descriptionDic[@"title"];
    cell.imageView.image = [UIImage imageNamed:descriptionDic[@"image"]];
    cell.detailTextLabel.text = descriptionDic[@"detail"];
    if (![descriptionDic[@"sel"] isEqualToString:@""]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryView = [[UIView alloc] init];
    }
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    CGFloat height = 10;
//    if (section == 0) {
//        height = 0;
//    }
//    return height;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 49;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * dic = self.OriginalData[indexPath.row];
    NSString * selName = dic[@"sel"];
    SEL action = NSSelectorFromString(selName);
    if ([self respondsToSelector:action]) {
        [self performSelector:action withObject:dic[@"detail"] afterDelay:0];
    }
}

- (void)goToWebPage:(NSString *)urlString
{
    urlString = [@"https://" stringByAppendingString:urlString];
    [self pushWebPage:urlString];
}

- (void)goToIntroductPage
{
//    [self pushWebPage:aboutH5Url];
}

- (void)pushWebPage:(NSString *)urlString
{
    BaseWebViewController * webViewController = [[BaseWebViewController alloc] initWithURL:urlString];
    webViewController.showNavigation = YES;
    [self.navigationController pushViewController:webViewController animated:YES];
}

-(void)setServer{
    NetAddressSettingController *vc = [[NetAddressSettingController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
