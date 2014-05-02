//
//  LYContext.h
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYContext : NSObject

/**
 *
 */
@property (nonatomic,strong) NSString *channel_name;  //频道名称
@property (nonatomic,strong) NSString *cell_type;   //cell样式
@property (nonatomic,strong) NSString *ID;  //频道ID
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *title_pic; //图片链接地址
@property (nonatomic,strong) NSString *updated_at;//更新时间
@property (nonatomic,strong) NSDictionary *channel_dic;
/**
 *  轮播信息
 */
@property (nonatomic,strong) NSArray *items;  //首页轮播信息
@property (nonatomic,strong) NSString *target_link; //点击图片要跳转的地址
@property (nonatomic,strong) NSString *type;    //是否免费
+(LYContext *)sharedInstance;

@end
