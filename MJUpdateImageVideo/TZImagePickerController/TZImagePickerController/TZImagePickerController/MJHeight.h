//
//  MJHeight.h
//  222
//
//  Created by 李宏贵 on 2020/1/9.
//  Copyright © 2020 李宏贵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MJHeight : NSObject
/**
 *设置导航栏背景色
 */
+(void)mjNaviBarColor:(UIViewController *)vc withColor:(UIColor *)color withAlpha:(CGFloat )alpha;
+ (UIImage *)tz_imageNamedFromMyBundle:(NSString *)name;
/**
 *导航栏高度
 */
+ (CGFloat)mjNavBarHeight;
+ (CGFloat)mjNaviHeight;
/**
 *状态栏高度
 */
+ (CGFloat)mjStatusHeight;
/**
 *tabBar栏高度
 */
+ (CGFloat)mjTabBarHeight;
/**
 *screenWidth
 */
+ (CGFloat)mjScreenWidth;
+ (BOOL)isIphoneX;
/**
 *screenHeight
 */
+ (CGFloat)mjScreenHeight;
@end

NS_ASSUME_NONNULL_END
