//
//  CALayer+transition.m
//  mrtc
//
//  Created by boundlessocean on 2018/9/28.
//  Copyright © 2018年 MT. All rights reserved.
//

#import "CALayer+transition.h"

@implementation CALayer (transition)
- (void)bl_transtionDuration:(CGFloat)duration
                        type:(NSString *)type
                     subType:(NSString *)subType
                animationKey:(NSString *)key{
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.type = type;
    transition.subtype = subType;
    [self addAnimation:transition forKey:key];
}
@end
