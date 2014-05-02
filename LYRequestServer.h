//
//  LYRequestServer.h
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LYRequestServerDelegate <NSObject>

-(void)getReturnDataFromServer:(id)data;

@end

@interface LYRequestServer : NSObject <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSURLConnection *_connection;
    NSMutableData *_data;
}

@property (nonatomic,assign)id<LYRequestServerDelegate>deleate;
-(instancetype)init;
-(void)getRequestServer:(NSString *)urlString;

//+(id)sharedRequestServer;
@end
