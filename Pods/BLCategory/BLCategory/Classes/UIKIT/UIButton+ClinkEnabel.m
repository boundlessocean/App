//
//  UIButton+ClinkEnabel.m
//  TrafficPlatform
//
//  Created by boundlessocean on 2018/5/15.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "UIButton+ClinkEnabel.h"

@implementation UIButton (ClinkEnabel)
-(BOOL)isTouchInside
{
    self.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = YES;
    });
    return YES;
}
@end
