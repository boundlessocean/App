//
//  UIViewController+LCAdd.m
//  LemonClientAPP
//
//  Created by xiaoping on 2017/5/9.
//  Copyright © 2017年 Lemon. All rights reserved.
//

#import "UIViewController+LCAdd.h"
#import "UIAlertAction+LCAdd.h"
@implementation UIViewController (LCAdd)

- (void)lc_alertShowWithTitle:(NSString *)title message:(NSString *)message {
    [self lc_alertShowWithTitle:title message:message handler:nil];
}

- (void)lc_alertShowWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray<UIAlertAction *> *)actions {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [actions enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [alert addAction:obj];
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)lc_alertShowWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *))handler {
    if ([title isEqual:[NSNull null]]) {
        title = @"";
    }
    if ([message isEqual:[NSNull null]]) {
        message = @"";
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction lc_defaultActionWithTitle:@"确定" handler:^(UIAlertAction *action) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            handler?handler(action):NULL;
        });
    }];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (UIAlertController *)lc_alertShowWithTitle:(NSString *)title message:(NSString *)message l_title:(NSString *)l_title r_title:(NSString *)r_title cancelHandler:(void (^)(UIAlertAction *))cancelHandler confirmHandler:(void (^)(UIAlertAction *))confirmHandler{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addAction:[UIAlertAction lc_defaultActionWithTitle:l_title handler:cancelHandler]];
    
    UIAlertAction *cancelAlert = [UIAlertAction actionWithTitle:r_title style:UIAlertActionStyleDefault handler:confirmHandler];
    [alertVC addAction:cancelAlert];
    [self presentViewController:alertVC animated:YES completion:nil];
    return alertVC;
}

- (void)lc_alertShowWithTitle:(NSString *)title message:(NSString *)message cancelHandler:(void (^)(UIAlertAction *))cancelHandler confirmHandler:(void (^)(UIAlertAction *))confirmHandler {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:cancelHandler]];
    [alertVC addAction:[UIAlertAction lc_defaultActionWithTitle:@"确定" handler:confirmHandler]];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}


- (UIAlertController *)lc_alertShowWithTitle:(NSString *)title
                                     message:(NSString *)message
                                     l_title:(NSString *)l_title
                                     r_title:(NSString *)r_title
                                     l_color:(UIColor *)l_color
                                     r_color:(UIColor *)r_color
                                 leftHandler:(void (^)(UIAlertAction *action))leftHandler
                                rightHandler:(void (^)(UIAlertAction *action))rightHandler{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addAction:[UIAlertAction lc_actionWithTitle:l_title color:l_color handler:leftHandler]];
    [alertVC addAction:[UIAlertAction lc_actionWithTitle:r_title color:r_color handler:rightHandler]];
    [self presentViewController:alertVC animated:YES completion:nil];
    return alertVC;
}

@end
