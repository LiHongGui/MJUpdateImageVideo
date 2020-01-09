//
//  PERotateView.h
//  222
//
//  Created by 李宏贵 on 2020/1/9.
//  Copyright © 2020 李宏贵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZQUtil;
@interface PERotateView : UIView
@property (strong,nonatomic) UIImage *image;
-(void)changeImageRoate:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
