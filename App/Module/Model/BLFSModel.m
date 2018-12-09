//
//  BLFSModel.m
//  App
//
//  Created by boundlessocean on 2018/12/9.
//  Copyright © 2018年 boundless. All rights reserved.
//

#import "BLFSModel.h"
@implementation BLFSModel

- (void)setCreateTime:(NSString *)createTime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:createTime.integerValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd HH:mm"];
    _createTime = [formatter stringFromDate: date];
}

- (void)setType:(NSString *)type{
    _type = type;
    _barType = [type isEqualToString:@"question"];
}

@end
