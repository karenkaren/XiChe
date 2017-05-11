//
//  ShopProfileView.h
//  XiChe
//
//  Created by LiuFeifei on 2017/4/6.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopProfileModel.h"

@interface ShopProfileCell : UITableViewCell

@property (nonatomic, strong) ShopProfileModel * shopProfile;
//@property (nonatomic, copy) void(^reserveBlock)(ShopProfileCell * cell, UIButton * button);
- (CGFloat)getAutoCellHeightWithShopProfile:(ShopProfileModel *)shopProfile ;

@end
