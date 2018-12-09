//
//  UILabel+Add.h
//  App
//
//  Created by boundlessocean on 2018/12/8.
//  Copyright © 2018年 boundless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Add)

/**
 配置标签

 @param tag 标签视图
 @param text 文本文字
 */
- (void)bs_configTag:( __kindof UIView * _Nullable )tag
                    :(NSString * _Nonnull)text;
@end
