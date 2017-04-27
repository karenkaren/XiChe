//
//  ShopProfileCell.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/6.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "ShopProfileCell.h"

@interface ShopProfileCell ()

@property (nonatomic, strong) UIImageView * shopImageView;
@property (nonatomic, strong) UIView * starsView;
@property (nonatomic, strong) UILabel * shopNameLabel;
@property (nonatomic, strong) UILabel * shopAddressLabel;
@property (nonatomic, strong) UILabel * washingCountLabel;
@property (nonatomic, strong) UILabel * queueingCountLabel;
@property (nonatomic, strong) UILabel * waitingTimeLabel;
@property (nonatomic, strong) UILabel * preferentialInfoLabel;

@end

@implementation ShopProfileCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllSubviews];
    }
    return self;
}

- (void)addAllSubviews
{
    self.shopImageView = [[UIImageView alloc] init];
    [self addSubview:self.shopImageView];
    
    self.starsView = [[UIView alloc] init];
    [self addSubview:self.starsView];
    
    self.shopNameLabel = [self createLabel];
    [self addSubview:self.shopNameLabel];
    
    self.shopAddressLabel = [self createLabel];
    [self addSubview:self.shopAddressLabel];
    
    self.washingCountLabel = [self createLabel];
    [self addSubview:self.washingCountLabel];
    
    self.queueingCountLabel = [self createLabel];
    [self addSubview:self.queueingCountLabel];
    
    self.waitingTimeLabel = [self createLabel];
    [self addSubview:self.waitingTimeLabel];
    
    self.preferentialInfoLabel = [self createLabel];
    [self addSubview:self.preferentialInfoLabel];
    
//    kWeakSelf
    UIButton * appointmentButton = [UIButton createButtonWithTitle:@"预约" color:kLinkColor font:kFont(20) block:^(UIButton *button) {
        DLog(@"开始预约");
//        kStrongSelf
//        if (strongSelf.reserveBlock) {
//            strongSelf.reserveBlock(strongSelf, button);
//        }
    }];
    appointmentButton.enabled = NO;
    [self addSubview:appointmentButton];
    
    [self.shopImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kCommonMargin);
        make.top.equalTo(self);
        make.width.height.equalTo(@100);
    }];
    
    [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shopImageView.mas_right).offset(kGeneralSize);
        make.top.equalTo(self);
        make.width.equalTo(self).offset(-3 * kCommonMargin);
        make.height.greaterThanOrEqualTo(@18);
    }];
    
    [self.starsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(@[self.shopNameLabel, self.shopAddressLabel]);
        make.top.equalTo(self.shopNameLabel.mas_bottom).offset(10);
        make.height.equalTo(@30);
    }];
    
    [self.shopAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.starsView.mas_bottom).offset(10);
        make.height.greaterThanOrEqualTo(@18);
    }];
    
    [self.washingCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shopImageView.mas_bottom).offset(10);
        make.left.equalTo(self.shopImageView);
        make.width.equalTo(self).offset(-20).multipliedBy(1.0 / 3.0);
        make.height.greaterThanOrEqualTo(@18);
    }];
    
    [self.queueingCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.washingCountLabel.mas_right).offset(10);
        make.top.width.equalTo(@[self.washingCountLabel, self.waitingTimeLabel]);
        make.height.greaterThanOrEqualTo(@18);
    }];
    
    [self.waitingTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.queueingCountLabel.mas_right).offset(10);
        make.height.greaterThanOrEqualTo(@18);
    }];
    
    [self.preferentialInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.washingCountLabel);
        make.top.equalTo(self.washingCountLabel.mas_bottom).offset(10);
        make.width.equalTo(self).offset(-3 * kCommonMargin - 60);
        make.height.greaterThanOrEqualTo(@18);
    }];
    
    [appointmentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-kCommonMargin);
        make.top.equalTo(self.preferentialInfoLabel);
        make.height.equalTo(self.preferentialInfoLabel);
        make.width.equalTo(@60);
    }];

}

- (UILabel *)createLabel
{
    UILabel * label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.font = kFont(18);
    label.textColor = kTextColor;
    return label;
}

- (CGFloat)getAutoCellHeight {

    [self layoutIfNeeded];

    /**
     *    self.最底部的控件.frame.origin.y      为自适应cell中的最后一个控件的Y坐标
     *    self.最底部的空间.frame.size.height   为自适应cell中的最后一个控件的高
     *    marginHeight    为自适应cell中的最后一个控件的距离cell底部的间隙
     */
//    return  self.最底部的控件.frame.origin.y + self.最底部的空间.frame.size.height + marginHeight;
    return  self.preferentialInfoLabel.bottom + kCommonMargin;

}

- (void)setShopProfile:(ShopProfileModel *)shopProfile
{
    _shopProfile = shopProfile;
//    self.shopImageView.image = shopProfile.shopImage;
    self.shopImageView.image = shopProfile.shopImage ?: [UIImage imageNamed:[NSString stringWithFormat:@"welcome_image_0"]];
    self.shopNameLabel.text = shopProfile.shopName;
    self.starsView.backgroundColor = kRandomColor;
    self.shopAddressLabel.text = shopProfile.shopLocation;
    self.washingCountLabel.text = [NSString stringWithFormat:@"正在洗车数:%ld个", shopProfile.worker];
    self.queueingCountLabel.text = [NSString stringWithFormat:@"排队人数:%ld个", shopProfile.washSpace];
    self.waitingTimeLabel.text = [NSString stringWithFormat:@"等待时间:%.1f小时", shopProfile.waitingTime];
//    self.preferentialInfoLabel.text = shopProfile.preferentialInfo;
    self.preferentialInfoLabel.text = (![NSString isEmpty:shopProfile.preferentialInfo]) ? shopProfile.preferentialInfo : @"周二上午8:00～12:00八折洗车";
}

@end
