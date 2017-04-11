//
//  ShopDetailController.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/9.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "ShopDetailController.h"
#import "ProvincesView.h"


@interface ShopDetailController ()

@property (nonatomic, strong) ShopProfileModel * shopProfile;

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
    UIButton * button = [UIButton createButtonWithTitle:@"省份" color:kTextColor font:kFont(18) block:^(UIButton *button) {
        ProvincesView * view = [[ProvincesView alloc] init];
        [self.view addSubview:view];
    }];
    [self.view addSubview:button];

}

@end
