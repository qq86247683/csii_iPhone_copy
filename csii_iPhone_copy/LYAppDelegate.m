//
//  LYAppDelegate.m
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import "LYAppDelegate.h"
#import "LYButton.h"
#import "UIButton+WebCache.h"

@implementation LYAppDelegate
{
    LYShufflingView *shufflingView;
    UIScrollView *scrollView;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    NSString *urlString = [[NSString alloc]initWithFormat:@"%@%@",BaseURL,HomeURL];
    [[LYHTTPSession sharedInstance]requset:urlString];
    [[LYHTTPSession sharedInstance] setDelegate:self];
    

    
    [self.window makeKeyAndVisible];
    return YES;
}
//得到的数据
-(void)requestFinishLoading:(id)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        [LYContext sharedInstance].channel_dic = [data objectAtIndex:0];
    }
    [self CreateView];
}

-(void)CreateView
{
    shufflingView = [[LYShufflingView alloc]initWithFrame:CGRectMake(5, 20, 305, 90)];
    
    [shufflingView CreateView:[LYContext sharedInstance].items];
    shufflingView.delegate = self;
    [self.window addSubview:shufflingView];
}

#pragma --mark LYShufflingViewDelegate
-(void)buttonSelect:(id)sender
{
    NSLog(@"%@",[LYContext sharedInstance].target_link);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
