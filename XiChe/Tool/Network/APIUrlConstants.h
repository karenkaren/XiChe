//
//  APIUrlConstants.h
//  LingTouNiaoZF
//
//  Created by LiuFeifei on 16/10/24.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIUrlConstants : NSObject

+ (NSArray *)getCachePaths;

#pragma mark - url
#pragma mark -- 用户服务
extern NSString * const kGetBackPasswordSendMobileCodeUrl;    // 找回密码发送短信验证码
extern NSString * const kVerifyMobileCodeUrl; // 找回密码验证短信验证码和身份证
extern NSString * const kRetrievePasswordUrl;    // 找回密码提交

extern NSString * const kUserRegisterSendMobileCodeUrl;   // 发送注册短信验证码
extern NSString * const kUserRegisterUrl;  // 注册提交

extern NSString * const kUserLoginUrl; // 登录
extern NSString * const kGetPictureCaptchaUrl;   // 获取图形验证码
extern NSString * const kUserLogoutUrl;    // 退出登录

#pragma mark -- 业务服务
// 绑卡
//extern NSString * const pay_bankList;   // 银行列表
//extern NSString * const usr_checkIdCard;    // 是否已经在领投鸟实名
//extern NSString * const usr_checkBindCard;  // 输入基本信息后验证银行卡是否可以绑定
//extern NSString * const usr_notificateBindCardResult;   // 绑卡成功或失败后通知服务器

// 上传图片
//extern NSString * const loanApply_upload;

#pragma mark - h5
//// 帮助
//extern NSString * const helpH5Url;
//// 用户注册协议
//extern NSString * const registerProtocolH5Url;
//// 隐私条款
//extern NSString * const registerPrivacyH5Url;
//// 关于花无忧
//extern NSString * const aboutH5Url;

@end
