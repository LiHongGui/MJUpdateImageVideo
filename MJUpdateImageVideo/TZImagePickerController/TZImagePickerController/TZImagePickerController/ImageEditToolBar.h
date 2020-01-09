//
//  ImgeEditToolBar.h
//  FileLibraryDemo
//
//  Created by 肖兆强 on 2017/6/10.
//  Copyright © 2017年 jwzt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQUtil.h"

@protocol ImageEditToolBarDelegate <NSObject>

-(void)imageEditToolBarSelectedAtIndex:(NSInteger)index;

@end



@interface ImageEditToolBar : UIView

@property (nonatomic ,weak) id<ImageEditToolBarDelegate>delegate;

@end
