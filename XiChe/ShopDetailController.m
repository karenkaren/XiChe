//
//  ShopDetailController.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/9.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "ShopDetailController.h"
#import "ProvincesView.h"
#import "ShopOrderModel.h"

@interface ShopDetailController ()

@property (nonatomic, strong) ShopProfileModel * shopProfile;
@property (nonatomic, strong) NSArray * shopServices;

@end

@implementation ShopDetailController

- (instancetype)initWithShopProfile:(ShopProfileModel *)shopProfile
{
    self = [super init];
    if (self) {
        self.shopProfile = shopProfile;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"洗车店详情";
//    UIButton * button = [UIButton createButtonWithTitle:@"省份" color:kTextColor font:kFont(18) block:^(UIButton *button) {
//        ProvincesView * view = [[ProvincesView alloc] init];
//        [self.view addSubview:view];
//    }];
//    [self.view addSubview:button];
    
    UIButton * button = [UIButton createButtonWithTitle:@"立即预约" color:kTextColor font:kFont(18) block:^(UIButton *button) {
//        ProvincesView * view = [[ProvincesView alloc] init];
//        [self.view addSubview:view];
        [self reserveService];
    }];
    button.enabled = NO;
    [self.view addSubview:button];
    
    NSDictionary * params = @{@"currentPage" : @0, @"pageSize" : @10, @"shopId" : @(self.shopProfile.shopId)};
    [ShopServiceModel getShopServices:params block:^(id response, id data, NSError *error) {
        if (data && isArray(data)) {
            self.shopServices = data;
            button.enabled = YES;
        }
    }];
}

- (void)reserveService
{
    NSDictionary * params = @{@"shopId" : @100002, @"shopName" : @"dsfdsfs", @"totalAmount" : @100, @"reserveBegintime" : @"2012-09-09 12:20:00"};
    [ShopOrderModel submitShopOrder:params shopServices:self.shopServices block:^(id response, id data, NSError *error) {
        if (!error) {
            [NSObject showMessage:@"订单提交成功"];
        }
    }];
}

@end
