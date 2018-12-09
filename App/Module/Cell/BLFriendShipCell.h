//
//  BLFriendShipCell.h
//  App
//
//  Created by boundlessocean on 2018/12/8.
//  Copyright © 2018年 boundless. All rights reserved.
//
#import "BLFSModel.h"
@import BLBase.BLCell;
@import BLBase.BLView;

typedef NS_ENUM(NSInteger, BLFriendShipCellActionType) {
    /** 点击用户头像 */
    BLFriendShipCellActionTypeUser,
    /** 点击图片 */
    BLFriendShipCellActionTypeIMG,
    /** 点击位置 */
    BLFriendShipCellActionTypeLocation,
    /** 转发 */
    BLFriendShipCellActionTypeShare,
    /** 评论 */
    BLFriendShipCellActionTypeComment,
    /** 点赞 */
    BLFriendShipCellActionTypeFavour,
    /** 帮助他 */
    BLFriendShipCellActionTypeHelp
};

typedef NS_ENUM(NSInteger, BLToolBarViewType) {
    /** 普通Bar */
    BLToolBarViewTypeNormal,
    /** 提问Bar */
    BLToolBarViewTypeQuestion
};

@interface BLFriendShipCell : BLCell
@property (nonatomic ,strong) BLFSModel *model;
@end

/** 标签 */
@interface BLTagView : BLView
@property (nonatomic ,strong) NSArray <NSString *> *tags;
@end

/** 图片 */
@interface BLIMGView : BLView
@property (nonatomic ,strong) NSArray <NSString *> *images;
@end

/** ToolBar */
@interface BLToolBarView : BLView
@property (nonatomic ,assign) BLToolBarViewType barType;
@end;
