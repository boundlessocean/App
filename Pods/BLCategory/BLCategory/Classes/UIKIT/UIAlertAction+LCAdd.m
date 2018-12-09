//
//  UIAlertAction+LCAdd.m
//  LemonClientAPP
//
//  Created by xiaoping on 2017/5/11.
//  Copyright © 2017年 Lemon. All rights reserved.
//

#import "UIAlertAction+LCAdd.h"
#import <objc/runtime.h>

@implementation UIAlertAction (LCAdd)

+ (instancetype)lc_defaultActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
    
    UIAlertAction *alert = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:handler];
    return alert;
}

+ (instancetype)lc_actionWithTitle:(NSString *)title
                             color:(UIColor *)color
                           handler:(void (^)(UIAlertAction *action))handler{
    
    UIAlertAction *alert = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:handler];
    [alert setValue:color forKey:@"_titleTextColor"];
    return alert;
}


@end
