//
//  MJHeight.m
//  222
//
//  Created by 李宏贵 on 2020/1/9.
//  Copyright © 2020 李宏贵. All rights reserved.
//

#import "MJHeight.h"
#import <UIKit/UIKit.h>
#import "TZImagePickerController.h"
@implementation MJHeight
#pragma mark-:设置导航栏背景色
+(void)mjNaviBarColor:(UIViewController *)vc withColor:(UIColor *)color withAlpha:(CGFloat )alpha
{


    [vc.navigationController.navigationBar setBackgroundImage:[MJHeight createImageWithColor:[color colorWithAlphaComponent:alpha] withRect:CGRectMake(0, 0, 1, 1)] forBarMetrics:UIBarMetricsDefault];
    [vc.navigationController.navigationBar setShadowImage:[UIImage new]];
    if (alpha>=1) {
        [vc.navigationController setNavigationBarHidden:NO animated:NO];
        vc.navigationController.navigationBar.translucent = NO;
    }else {
//        [vc.navigationController setNavigationBarHidden:YES animated:NO];
        vc.navigationController.navigationBar.translucent = YES;
    }
}
#pragma mark-: *自定义图片大小:UISlider的大小等等
+(UIImage*)createImageWithColor:(UIColor*)color withRect:(CGRect)rect
{
    //    rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
+ (BOOL)isIphoneX {
    if ([UIApplication sharedApplication].statusBarFrame.size.height == 44) {
        return YES;
    }
    else {
        return NO;
    }
}
#pragma mark-导航栏高度
+ (CGFloat)mjNavBarHeight
{
    if ([self isIphoneX]) {
        return 88;
    }
    else {
        return 64;
    }
}
#pragma mark-状态栏高度
+ (CGFloat)mjStatusHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}
+ (CGFloat)mjNaviHeight
{
    if ([self isIphoneX]) {
        return 88;
    }
    else {
        return 64;
    }
}
#pragma mark-导航栏高度
+ (CGFloat)mjTabBarHeight
{
    if ([self isIphoneX]) {
        return 83;
    }
    else {
        return 49;
    }
}
#pragma mark-screenWidth
+ (CGFloat)mjScreenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}
+ (NSBundle *)tz_imagePickerBundle {
//    [NSBundle bundleForClass:[]]
    NSBundle *bundle = [NSBundle bundleForClass:[TZImagePickerController class]];
    NSURL *url = [bundle URLForResource:@"TZImagePickerController" withExtension:@"bundle"];
    bundle = [NSBundle bundleWithURL:url];
    return bundle;
}
+ (UIImage *)tz_imageNamedFromMyBundle:(NSString *)name {
    NSBundle *imageBundle = [NSBundle tz_imagePickerBundle];
    name = [name stringByAppendingString:@"@2x"];
    NSString *imagePath = [imageBundle pathForResource:name ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if (!image) {
        // 兼容业务方自己设置图片的方式
        name = [name stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
        image = [UIImage imageNamed:name];
    }
    return image;
}
#pragma mark-screenHeight
+ (CGFloat)mjScreenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}
@end
