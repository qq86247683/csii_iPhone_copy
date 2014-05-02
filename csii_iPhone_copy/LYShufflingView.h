//
//  LYShufflingView.h
//  csii_iPhone_copy
//  轮播视图
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LYShufflingViewDelegate <NSObject>

-(void)buttonSelect:(id)sender;

@end

@interface LYShufflingView : UIView <LYShufflingViewDelegate>

@property (nonatomic,assign) id <LYShufflingViewDelegate>delegate;

-(void)CreateView:(NSArray *)array;

@end
