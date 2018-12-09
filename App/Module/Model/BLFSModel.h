//
//  BLFSModel.h
//  App
//
//  Created by boundlessocean on 2018/12/9.
//  Copyright © 2018年 boundless. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLFSModel : NSObject

@property (nonatomic ,strong) NSString *avatar;
@property (nonatomic ,strong) NSString *userName;
@property (nonatomic ,strong) NSString *createTime;
@property (nonatomic ,strong) NSString *headLine;
@property (nonatomic ,strong) NSArray<NSString *> *tags;
@property (nonatomic ,strong) NSString *topic;
@property (nonatomic ,strong) NSArray<NSString *> *images;
@property (nonatomic ,assign) NSInteger viewCount;
@property (nonatomic ,strong) NSString *address;
@property (nonatomic ,strong) NSString *type;
@property (nonatomic ,assign) NSInteger barType;
@end
