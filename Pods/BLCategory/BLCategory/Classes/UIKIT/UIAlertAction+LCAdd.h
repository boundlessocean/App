//
//  UIAlertAction+LCAdd.h
//  LemonClientAPP
//
//  Created by xiaoping on 2017/5/11.
//  Copyright © 2017年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertAction (LCAdd)

+ (instancetype)lc_defaultActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;

+ (instancetype)lc_actionWithTitle:(NSString *)title
                             color:(UIColor *)color
                           handler:(void (^)(UIAlertAction *action))handler;

@end
