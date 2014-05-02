//
//  LYShufflingView.m
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import "LYShufflingView.h"
#import "LYButton.h"
#import "UIButton+WebCache.h"

@implementation LYShufflingView
{
    NSMutableArray *imageArray;
    NSMutableArray *channelArray;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        imageArray = [[NSMutableArray alloc]initWithCapacity:0];
        channelArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

-(void)CreateView:(NSArray *)array
{    
    int i = 0;
    NSLog(@"%@",[LYContext sharedInstance].channel_dic);
    [LYContext sharedInstance].items = [[LYContext sharedInstance].channel_dic objectForKey:@"items"];
    
    for (NSDictionary *dic in [LYContext sharedInstance].items) {
        
        LYButton *button = [LYButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(5 + 305 * i, 20, 305, 90)];
        [button createButton:[dic objectForKey:@"title"]];
        [button setImageWithURL:[dic objectForKey:@"title_pic"]];
        [button setUserInteractionEnabled:YES];
        [button addTarget:self action:@selector(changeView:buttonTag:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:i];
        [self addSubview:button];
        [channelArray addObject:dic];
        i++;
    }
}

-(void)changeView:(id)sender buttonTag:(NSInteger)tag
{
    LYButton *button = (LYButton *)[self viewWithTag:tag];
    
    [LYContext sharedInstance].target_link = [[channelArray objectAtIndex:button.tag] objectForKey:@"target_link"];
    
    [self.delegate buttonSelect: [LYContext sharedInstance].target_link];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
