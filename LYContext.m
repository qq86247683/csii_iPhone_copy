//
//  LYContext.m
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import "LYContext.h"

@implementation LYContext
+(LYContext *)sharedInstance
{
    static LYContext *context = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        context = [[LYContext alloc]init];
    });
    return context;
}
@end
