//
//  ImgeEditToolBar.m
//  FileLibraryDemo
//
//  Created by 肖兆强 on 2017/6/10.
//  Copyright © 2017年 jwzt. All rights reserved.
//

#import "ImageEditToolBar.h"
#import "MJHeight.h"
@interface ImageEditToolBar ()

@end

@implementation ImageEditToolBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
        self.backgroundColor = [UIColor blackColor];
//        [self addTestBorderToSubviews];
    }
    return self;
}


-(NSArray*)imageNames
{
    return @[[MJHeight tz_imageNamedFromMyBundle:@"caijian_icon"],[MJHeight tz_imageNamedFromMyBundle:@"xuanzhuan"],@""];
}

-(void)buildUI
{
//    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    
    CGFloat btnHeight = 40.0f;
    CGFloat marginX = 20;
    CGFloat marginY = (self.bounds.size.height - btnHeight)/2.0f;
    CGFloat btnX = 0;
    for (int i = 0; i<[self imageNames].count; i ++) {
        if (i == 2) {
            btnX = self.frame.size.width-marginX-btnHeight;
        }else {
            btnX = (i + 1)*marginX + i * btnHeight;

        }
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(btnX, marginY, btnHeight, btnHeight)];
        
        if (i == 2) {
            [button setTitle:@"完成" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
        }else {
            [button setImage:[self imageNames][i] forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(btnClickMethod:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self addSubview:button];
    }
}

-(void)btnClickMethod:(UIButton*)button
{
    if ([_delegate respondsToSelector:@selector(imageEditToolBarSelectedAtIndex:)]) {
        [_delegate imageEditToolBarSelectedAtIndex:button.tag];
    }
}



@end
