//
//  LYHTTPSession.m
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import "LYHTTPSession.h"

@implementation LYHTTPSession
{
    LYRequestServer *_reqeuestServer;
}

+(LYHTTPSession *)sharedInstance
{
    static LYHTTPSession *seccion = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        seccion = [[LYHTTPSession alloc]init];
    });
    return seccion;
}

-(void)requset:(NSString *)strUrl
{
    _reqeuestServer = [[LYRequestServer alloc]init];
    _reqeuestServer.deleate = self;
    [_reqeuestServer getRequestServer:strUrl];
}

#pragma mark --LYRequestServerDelegate
-(void)getReturnDataFromServer:(id)data
{
    NSArray *channelsArray = nil;
    
    if ([data isKindOfClass:[NSDictionary class]]) {
        channelsArray = [data objectForKey:@"channels"];
        channels = channelsArray;
        [self.delegate requestFinishLoading:channels];
        return;
    }
    if ([data isKindOfClass:[UIImage class]]) {
        [self.delegate requestFinishLoading:data];
    }
}

@end
