//
//  NSString+Add.h
//  mrtc
//
//  Created by boundlessocean on 2018/9/7.
//  Copyright © 2018年 xycentury. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Add)
/** 距离今天天数 */
- (NSInteger )bl_daySinceNow;

/** 距离未来某一天的天数（有效期） */
- (NSInteger)bl_daySinceOver;

/** MM-dd HH:mm 时间获取 */
- (NSString *)bl_formatDate;

/** yyyy-MM-ddHH:mm:ss Date获取 */
- (NSDate *)bl_date;
@end
