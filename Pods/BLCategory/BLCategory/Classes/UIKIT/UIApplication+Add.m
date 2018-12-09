//
//  UIApplication+Add.m
//  BLCategory
//
//  Created by boundlessocean on 2018/11/27.
//

#import "UIApplication+Add.h"

@implementation UIApplication (Add)
+ (CGFloat)height{
    return UIApplication.sharedApplication.statusBarFrame.size.height;
}
@end
