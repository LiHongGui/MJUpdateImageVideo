//
//  TZEditBar.h
//  222
//
//  Created by 李宏贵 on 2020/1/6.
//  Copyright © 2020 李宏贵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TZEditBar;
@protocol TZEditBarDelegate<NSObject>
-(void)tzEditBar:(TZEditBar *)tzEditBar withClickEditBtn:(UIButton *)clickEditBtn;
@end
@interface TZEditBar : UIView
-(void)setupUI:(NSInteger )tag;
@property(nonatomic,weak) id<TZEditBarDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
