//
//  LYHTTPSession.h
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYRequestServer.h"

@protocol LYHTTPSessionDelegate <NSObject>

//返回请求的数据
-(void)requestFinishLoading:(id)data;
@end

@interface LYHTTPSession : NSObject <LYRequestServerDelegate>
{
    NSArray *channels; //频道数组
    NSArray *items;    //轮播信息
}

@property (nonatomic,assign) id <LYHTTPSessionDelegate>delegate;

+(LYHTTPSession *)sharedInstance;

-(void)requset:(NSString *)strUrl;//向服务器发请求
@end
