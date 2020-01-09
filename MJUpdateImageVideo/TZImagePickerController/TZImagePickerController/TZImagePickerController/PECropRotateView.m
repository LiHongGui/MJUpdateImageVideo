////
////  PECropRotateView.m
////  222
////
////  Created by 李宏贵 on 2020/1/9.
////  Copyright © 2020 李宏贵. All rights reserved.
////
//
//#import "PECropRotateView.h"
//#import "TZEditBar.h"
//#import "UIImage+Rotate.h"
//#import "UIImage+PECrop.h"
//#import "PERotateView.h"
//#import "PECropView.h"
//#import "UIView+Layout.h"
//@interface PECropRotateView()<TZEditBarDelegate>
//{
//    TZEditBar *_bottomBar;
//    PECropView *_peCropView;
//    PERotateView *_peRotateView;
//    NSInteger rotateIndex;
//    CGFloat toolBarHeight;
//    CGFloat toolBarTop;
//}
//@end
//@implementation PECropRotateView
//-(instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        [self configBottomToolBar];
//    }
//    return self;
//}
//- (void)configBottomToolBar
//{
//    toolBarHeight = [self tz_isIPhoneX] ? 44 + (83 - 49) : 44;
//    toolBarTop = self.tz_height - toolBarHeight;
//    _bottomBar = [[TZEditBar alloc]initWithFrame:CGRectMake(0, toolBarTop, self.tz_width, toolBarHeight)];
//    _bottomBar.delegate = self;
//    [self addSubview:_bottomBar];
//}
//- (BOOL)tz_isIPhoneX {
//    return (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||
//            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)) ||
//            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 896)) ||
//            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(896, 414)));
//}
//
//- (CGFloat)tz_statusBarHeight {
//    return [self tz_isIPhoneX] ? 44 : 20;
//}
//- (void)tzEditBar:(id)tzEditBar withClickEditBtn:(UIButton *)clickEditBtn
//{
//
////    UIView *superView = clickEditBtn.superview;
//    NSLog(@"%ld",(long)clickEditBtn.superview.tag);
//    NSLog(@"superviewClass:%@",NSStringFromClass(clickEditBtn.superclass));
//    switch (clickEditBtn.superview.tag) {
//        case 0:
//        {
//            switch (clickEditBtn.tag) {
//                case 0:
//                {
//                    [_peCropView removeFromSuperview];
//                }
//                    break;
//                case 1:
//                {
//                    [self cropingView];
//                }
//                    break;
//                case 2:
//                {
//                    [self rotateView];
//                }
//                    break;
//                default:
//                {
//
//                }
//                    break;
//            }
//        }
//            break;
//        case 1:
//        {
//            switch (clickEditBtn.tag) {
//                case 0:
//                {
//                    [_peCropView removeFromSuperview];
//                    [_bottomBar setupUI:0];
//                }
//                    break;
//                case 1:
//                {
//                    [_peCropView resetCropRect];
//                }
//                    break;
//                default:
//                {
//                    NSLog(@"完成");
//                }
//                    break;
//            }
//        }
//            break;
//
//        default:
//        {
//            switch (clickEditBtn.tag) {
//                case 0:
//                {
//                    [_peRotateView removeFromSuperview];
//                    [_bottomBar setupUI:0];
//                }
//                    break;
//                case 1:
//                {
//                    rotateIndex ++;
//                    if (rotateIndex == 4) {
//                        rotateIndex = 0;
//                    }
//                    [_peRotateView changeImageRoate:rotateIndex];
//                }
//                    break;
//                default:
//                {
//                    NSLog(@"完成");
//                }
//                    break;
//            }
//        }
//            break;
//    }
//
//
//}
//
//
//-(void)cropingView
//{
//    _peCropView = [[PECropView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, toolBarTop)];
//    [_bottomBar setupUI:1];
//    _peCropView.image = _image;
//
//    [self addFinishBlock:^(UIImage *image) {
//
//    }];
//
//    [self.view insertSubview:_peCropView belowSubview:_bottomBar];
//}
//-(void)rotateView
//{
//    _peRotateView = [[PERotateView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height)];
//       [_bottomBar setupUI:2];
//       _peRotateView.image = _image;
//
//       [self addFinishBlock:^(UIImage *image) {
//
//       }];
//
//       [self.view insertSubview:_peRotateView belowSubview:_bottomBar];
//}
//@end
