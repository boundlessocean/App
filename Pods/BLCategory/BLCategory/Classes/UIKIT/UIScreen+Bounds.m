//
//  UIScreen+Bounds.m
//  BLCategory
//
//  Created by boundlessocean on 2018/10/9.
//

#import "UIScreen+Bounds.h"

@implementation UIScreen (Bounds)
+ (CGFloat)width{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)height{
    return [UIScreen mainScreen].bounds.size.height;
}
@end
