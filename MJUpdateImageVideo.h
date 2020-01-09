 //
//  MJUpdateImageVideo.h
//  iDai
//
//  Created by 李宏贵 on 2019/8/8.
//  Copyright © 2019 李宏贵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void (^SuccessImageBlock)(id obj,UIImage *image);
typedef void (^SuccessVedioBlock)(id obj);
typedef void (^FailureImageBlock)(NSError *error);
typedef void (^FailureVedioBlock)(NSError *error);
@interface MJUpdateImageVideo : NSObject
/**
 *successImageBlock:(id obj,UIImage *image)
 *id obj:图片data
 */
@property (nonatomic, copy) SuccessImageBlock successImageBlock;
/**
 *successImageBlock:(id obj,UIImage *image)
 *id obj:视频data
 */
@property (nonatomic, copy) SuccessVedioBlock successVedioBlock;

@property (nonatomic, copy) FailureImageBlock failureImageBlock;
@property (nonatomic, copy) FailureVedioBlock failureVedioBlock;
/**
 *初始化
 */
+ (instancetype)updateManager;
/**
 *vc:当前控制器self
 */
//-(void)updateImageVideoView:(UIView *)customeView withVC:(UIViewController *)vc allowPickingMultipleVideo:(BOOL )allowPickingMultipleVideo;
/**
 *successImageBlock:(id obj,UIImage *image)
 *id obj:图片data
 */
- (void)pushTZImagePickerControllerWithVC:(UIViewController *)vc allowPickingMultipleVideo:(BOOL )allowPickingMultipleVideo successImageBlock:(SuccessImageBlock)successImageBlock;
/**
 *successImageBlock:(id obj,UIImage *image)
 *id obj:图片data
 */
//-(void)updateImageSuccessImage:(SuccessImageBlock)successImageBlock;
/**
 *successImageBlock:(id obj,UIImage *image)
  *id obj:视频data
 */
//-(void)updateVideoSuccessVedio:(SuccessVedioBlock)successVedioBlock;
@end

NS_ASSUME_NONNULL_END
