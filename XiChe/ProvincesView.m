//
//  ProvincesView.m
//  XiChe
//
//  Created by LiuFeifei on 2017/4/9.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "ProvincesView.h"

@interface ProvincesView ()

@property (nonatomic, strong) NSArray * provinces;

@end

@implementation ProvincesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kColorD8D8D8;
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    CGFloat width = kScreenWidth / 8.0;
    for (int i = 0; i < self.provinces.count; i++) {
        UIButton * button = [UIButton createButtonWithTitle:self.provinces[i] color:kTextColor font:kFont(18) block:^(UIButton *button) {
            
        }];
        CGFloat x = i % 8 * width;
        CGFloat y = i / 8 * width;
        button.frame = CGRectMake(x, y, width, width);
        button.backgroundColor = kWhiteColor;
        [self addSubview:button];
    }
    self.frame = CGRectMake(0, 0, kScreenWidth, self.subviews.lastObject.bottom);
    
}

#pragma mark - getter methods
- (NSArray *)provinces
{
    if (!_provinces) {
        _provinces = @[@"京",
                       @"津",
                       @"沪",
                       @"渝",
                       @"冀",
                       @"豫",
                       @"云",
                       @"辽",
                       @"黑",
                       @"湘",
                       @"皖",
                       @"鲁",
                       @"新",
                       @"苏",
                       @"浙",
                       @"赣",
                       @"鄂",
                       @"桂",
                       @"甘",
                       @"晋",
                       @"蒙",
                       @"陕",
                       @"吉",
                       @"闽",
                       @"贵",
                       @"粤",
                       @"青",
                       @"藏",
                       @"川",
                       @"宁",
                       @"琼"];
    }
    return _provinces;
}

@end
