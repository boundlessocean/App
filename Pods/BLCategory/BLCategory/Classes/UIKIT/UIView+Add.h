//
//  UIView+Add.h
//  TrafficPlatform
//
//  Created by boundlessocean on 2018/4/9.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (Add)
// 加载xib
+ (__kindof  UIView  *)xm_loadView;
// 动态添加手势
- (void)xm_tapActionWithBlock:(void (^)(void))block;
// 渐变色
- (void)xm_gradientLayer:(UIColor *)fromColor to:(UIColor *)toColor;
@end
