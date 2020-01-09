//
//  ImageEditViewController.h
//  FileLibraryDemo
//
//  Created by 肖兆强 on 2017/6/10.
//  Copyright © 2017年 jwzt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ImageEditViewControllerReturnBlock)(UIImage *image);
@interface ImageEditViewController : UIViewController
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,copy) ImageEditViewControllerReturnBlock
returnImageBlock;
//@property (copy,nonatomic) NSString *imagePath;

@end
