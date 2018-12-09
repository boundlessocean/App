//
//  CALayer+transition.h
//  mrtc
//
//  Created by boundlessocean on 2018/9/28.
//  Copyright © 2018年 MT. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (transition)
- (void)bl_transtionDuration:(CGFloat)duration
                        type:(NSString *)type
                     subType:(NSString *)subType
                animationKey:(NSString *)key;
@end
