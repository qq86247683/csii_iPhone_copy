//
//  LYButton.m
//  csii_iPhone_copy
//
//  Created by 刘杨 on 14-5-2.
//  Copyright (c) 2014年 刘杨. All rights reserved.
//

#import "LYButton.h"

@implementation LYButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)createButton:(NSString *)title
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,70,320,20)];
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor colorWithRed:0.1 green:0.4 blue:0.7 alpha:0.5];
    NSLog(@"%@",title);
    [self addSubview:label];
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
