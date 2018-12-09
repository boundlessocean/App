//
//  NSString+Add.m
//  mrtc
//
//  Created by boundlessocean on 2018/9/7.
//  Copyright © 2018年 xycentury. All rights reserved.
//

#import "NSString+Add.h"

@implementation NSString (Add)
- (NSInteger)bl_timestamp{
    return [self.bl_date timeIntervalSince1970];
}


- (NSDate *)bl_date{
//    if([dateString containsString:@"+"]){
//        dateString = [dateString substringToIndex:[dateString rangeOfString:@"+"].location];
//    }
    NSString *dateString = [self substringToIndex:18];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-ddHH:mm:ss";
    return [formatter dateFromString:dateString];
}

- (NSInteger)bl_daySinceNow{
    NSInteger now = [[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970];
    return self.length > 15 ? fabsf(ceilf((self.bl_timestamp - now)/(60*60*24.0))) : 0;
}


- (NSString *)bl_formatDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM-dd HH:mm";
    return [formatter stringFromDate:self.bl_date];
}


- (NSInteger)bl_daySinceOver{
    NSInteger now = [[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970];
    return self.length > 15 && self.bl_timestamp > now ? ceilf((self.bl_timestamp - now)/(60*60*24.0)) : 0;
}

@end
