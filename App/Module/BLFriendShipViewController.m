//
//  BLFriendShipViewController.m
//  App
//
//  Created by boundlessocean on 2018/12/8.
//  Copyright © 2018年 boundless. All rights reserved.
//

#import "BLFriendShipViewController.h"
#import "BLFriendShipCell.h"

@import BLBase.BLTableView;
@import BLBase.BLTableView_Refresh;
@import BLCategory.BLAppConfig;
@import Masonry;
@import YYKit.NSData_YYAdd;
@import YYKit.NSObject_YYModel;
@import MJRefresh;
@import AFNetworking.AFNetworkReachabilityManager;
@interface BLFriendShipViewController ()

/** Table */
@property (nonatomic ,strong) BLTableView *tableView;

@end

@implementation BLFriendShipViewController


- (void)bs_configViewDataSourse{
    [super bs_configViewDataSourse];
    self.title = @"朋友圈";
    self.bs_needSwitchStatuBarStyle = YES;
    self.bs_loadingView.bs_isNeedLoading = NO;
    [self monitoringNet];
    // 配置数据
    [self _configData];
    
    WEAKSELF
    // 配置Cell数据
    _tableView.bs_cellBlock = ^UITableViewCell *(UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
        STRONGSELF
        BLFriendShipCell *shipCell = (BLFriendShipCell *)cell;
        shipCell.model = self.tableView.bs_dataArray[indexPath.row];
        shipCell.bs_viewAction = GET_PARAMETERS({
            case BLFriendShipCellActionTypeShare:
            NSLog(@"转发");
            break;
            case BLFriendShipCellActionTypeComment:
            NSLog(@"评论");
            break;
            case BLFriendShipCellActionTypeHelp:
            NSLog(@"帮助");
            break;
            case BLFriendShipCellActionTypeFavour:
            NSLog(@"点赞");
            break;
        });
        return shipCell;
    };
}

- (void)bs_initializeSubviews{
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [super bs_initializeSubviews];
}

#pragma mark - - Private

- (void)_configData{
    self.tableView.bs_dataArray = [[NSArray modelArrayWithClass:BLFSModel.class json:[NSData dataNamed:@"data.json"]] mutableCopy];
    [_tableView reloadData];
}

- (void)monitoringNet{
    AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
    [netManager startMonitoring];  //开始监听
    [netManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        if (status == AFNetworkReachabilityStatusReachableViaWWAN||
            status == AFNetworkReachabilityStatusReachableViaWiFi){
            [_tableView reloadData];
        }
    }];
}


#pragma mark - - Getter

- (BLTableView *)tableView{
    if (!_tableView) {
        _tableView = BLTableView.bs_tableView;
        _tableView.bs_supportRefreshUp = NO;
        _tableView.bs_supportRefreshDown = NO;
        _tableView.bs_identifier = NSStringFromClass(BLFriendShipCell.class);
        _tableView.estimatedRowHeight = 400;
    }
    return _tableView;
}

@end
