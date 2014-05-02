//
//  LYRequestServer.m
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import "LYRequestServer.h"
static LYRequestServer *request;
@implementation LYRequestServer

//+(id)sharedRequestServer
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        request=[[LYRequestServer alloc]init];
//    });
//    return request;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = [NSMutableData data];
    }
    return self;
}

-(void)getRequestServer:(NSString *)urlString
{
    //得到要向服务器发送请求的URL地址
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest  requestWithURL:url];
    
    if (_connection != nil) {
        [_connection cancel];
        _connection = nil;
    }
    _connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [_connection start];
}

#pragma NSURLConnectionDataDelegate
//请求完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{

    NSError *error = nil;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableContainers error:&error];
        
    [self.deleate getReturnDataFromServer:jsonDic];
 
}

//得到数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

//开始请求
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_data setLength:0];
}

#pragma mark --NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.deleate getReturnDataFromServer:error];
}
@end
