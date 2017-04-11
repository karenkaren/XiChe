//
//  BaseTableViewController.h
//  XiChe
//
//  Created by LiuFeifei on 17/4/2.
//  Copyright © 2017年 LiuJie. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

//@property (assign) BOOL hideRefreshHeader;
//@property (assign) BOOL hideLoadingView;
//@property (nonatomic,assign) LoadingViewState loadingViewState;

@property (nonatomic) UITableView * tableView;
- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end
