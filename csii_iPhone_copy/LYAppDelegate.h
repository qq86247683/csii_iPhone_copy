//
//  LYAppDelegate.h
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYHTTPSession.h"
#import "LYShufflingView.h"

@interface LYAppDelegate : UIResponder <UIApplicationDelegate,LYHTTPSessionDelegate,LYShufflingViewDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
