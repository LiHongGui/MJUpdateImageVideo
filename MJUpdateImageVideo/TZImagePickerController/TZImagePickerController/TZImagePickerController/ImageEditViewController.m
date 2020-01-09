//
//  ImageEditViewController.m
//  FileLibraryDemo
//
//  Created by 肖兆强 on 2017/6/10.
//  Copyright © 2017年 ZQDemo. All rights reserved.
//

#import "ImageEditViewController.h"
//#import "ZQImageEdit.h"
//#import "ImageEditTitleView.h"
//#import "RecordingSQLModel.h"
//#import "SqliteControl+Recording.h"
#import "MJHeight.h"
#import "ImageEditToolBar.h"
#import "ZQImageCropController.h"
#import "ZQImageRotationController.h"
@interface ImageEditViewController ()<ImageEditToolBarDelegate>
//{
//    UIImageView *_imageView;
//    
//    UIImage *_image;
//    
//}
@property(nonatomic,strong) NSString *rotate;
@end

@implementation ImageEditViewController
#define kSave NSLocalizedString(@"保存", nil)
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    
    [self buildUI];
//    [self.view addTestBorderToSubviews];
}

-(void)buildUI
{
    self.view.backgroundColor = [UIColor blackColor];
    [MJHeight mjNaviBarColor:self withColor:[UIColor blackColor] withAlpha:1];
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[MJHeight tz_imageNamedFromMyBundle:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(clickLeftBar)];    NSLog(@"self.tabBarController.tabBar.frame.size.height:%f",self.tabBarController.tabBar.frame.size.height);
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, self.view.width, self.view.height-[MJHeight mjNaviHeight]-20-([MJHeight mjNaviHeight] == 64?40:70))];
    _imageView.image = _image;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    self.rotate = @"0";
    ImageEditToolBar *toolBar = [[ImageEditToolBar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame)+10, self.view.width, [MJHeight mjNaviHeight]== 64?40:70)];
    toolBar.delegate = self;
    [self.view addSubview:toolBar];
}

-(void)clickLeftBar
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark -
#pragma mark ImageEditToolBarDelegate
-(void)imageEditToolBarSelectedAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            NSLog(@"裁剪");
        {
            ZQImageCropController* cropVC = [[ZQImageCropController alloc] init];
            cropVC.image = _image;
            
            [cropVC addFinishBlock:^(UIImage *image) {
                _imageView.image = image;
                _image = image;
            }];
            [self.navigationController pushViewController:cropVC animated:NO];
//            [self presentViewController:cropVC animated:true completion:nil];
        }
            break;
        case 1:
            NSLog(@"旋转");
            {
                ZQImageRotationController* rotateVC = [[ZQImageRotationController alloc] init];
                
                rotateVC.image = _image;
                [rotateVC addFinishBlock:^(UIImage *image) {
                    _imageView.image = image;
                    _image = image;
//                    self.rotate = rotate;
                }];
//                [rotateVC addFinishBlock:^(UIImage *image) {
//
//                }];
                 [self.navigationController pushViewController:rotateVC animated:NO];
            }
            break;

        default:
        {
            if (self.returnImageBlock) {
                self.returnImageBlock(_image);
            }
            [self.navigationController popViewControllerAnimated:NO];
        }
            break;
    }
}



-(void)backMethod
{
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
