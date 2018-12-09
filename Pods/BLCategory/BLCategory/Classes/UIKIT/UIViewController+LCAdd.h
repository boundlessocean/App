//
//  UIViewController+LCAdd.h
//  LemonClientAPP
//
//  Created by xiaoping on 2017/5/9.
//  Copyright © 2017年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LCAdd)

- (void)lc_alertShowWithTitle:(NSString *)title message:(NSString *)message;

- (void)lc_alertShowWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *action))handler;


- (void)lc_alertShowWithTitle:(NSString *)title message:(NSString *)message cancelHandler:(void (^)(UIAlertAction *action))cancelHandler confirmHandler:(void (^)(UIAlertAction *action))confirmHandler;


- (UIAlertController *)lc_alertShowWithTitle:(NSString *)title
                                     message:(NSString *)message
                                     l_title:(NSString *)l_title
                                     r_title:(NSString*)r_title
                                     l_color:(UIColor *)l_color
                                     r_color:(UIColor*)r_color
                                 leftHandler:(void (^)(UIAlertAction *action))leftHandler
                                rightHandler:(void (^)(UIAlertAction *action))rightHandler;

@end
