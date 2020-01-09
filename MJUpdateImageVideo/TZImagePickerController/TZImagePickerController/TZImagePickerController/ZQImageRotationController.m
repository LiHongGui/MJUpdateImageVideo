//
//  ImageRotationViewController.m
//  FileLibraryDemo
//
//  Created by 肖兆强 on 2017/6/10.
//  Copyright © 2017年 jwzt. All rights reserved.
//

#import "ZQImageRotationController.h"
#import "ImageRotateToolBar.h"
#import "EditOperatingToolBar.h"
#import "UIImage+PECrop.h"
#import "UIImage+Rotate.h"
#import "ImageEditToolBar.h"
#import "MJHeight.h"
@interface ZQImageRotationController ()<ImageEditToolBarDelegate>
{
    UIImageView *_imageView;
    ImageBlock _block;
}
@property(nonatomic,assign) NSInteger rotate;
@property(nonatomic,strong) NSArray *rotateArray;
@property(nonatomic,strong) UIView *defaultView;
@property(nonatomic,strong) UIButton *btn;
@end
#define kPhotoRotate NSLocalizedString(@"图片旋转", nil)
@implementation ZQImageRotationController
-(NSArray *)rotateArray
{
    if (!_rotateArray) {
        _rotateArray = @[@"1",@"6",@"3",@"8"];
    }
    return _rotateArray;
}
-(UIView *)defaultView
{
    if (!_defaultView) {
        _defaultView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-[MJHeight mjNaviHeight]-([MJHeight mjNaviHeight]== 64?40:70), self.view.width, [MJHeight mjNaviHeight]== 64?40:70)];
        _defaultView.backgroundColor = [UIColor blackColor];
        CGFloat margin = (self.view.frame.size.width-40*3-40*2);
        NSArray *titles = @[[MJHeight tz_imageNamedFromMyBundle:@"cancel"],[MJHeight tz_imageNamedFromMyBundle:@"xuanzhuan"],[MJHeight tz_imageNamedFromMyBundle:@"duihao"]];
        for (int i = 0; i < titles.count; i++) {
            self.btn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.btn.frame)+20*(i <= 2?1:0)+margin*(i == 1?1:0), 0, 40, [MJHeight mjNaviHeight]== 64?40:70)];
            [_defaultView addSubview:self.btn];
            if (i == 0) {
//                self.btn.imageEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
            }
            [self.btn setImage:titles[i] forState:UIControlStateNormal];
            self.btn.tag = i;
            [self.btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.btn addTarget: self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return _defaultView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [MJHeight mjNaviBarColor:self withColor:[UIColor blackColor] withAlpha:1];
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[MJHeight tz_imageNamedFromMyBundle:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(clickLeftBar)];
    [self buildLayout];
}

-(void)clickLeftBar
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)buildLayout
{
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, self.view.width, self.view.height-[MJHeight mjNaviHeight]-20-([MJHeight mjNaviHeight] == 64?40:70))];
    _imageView.image = self.image;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];

//    ImageRotateToolBar *roateView = [[ImageRotateToolBar alloc] initWithFrame:CGRectMake(0, self.view.height - self.tabBarController.tabBar.frame.size.height*2-[MJHeight mjNaviHeight], self.view.width, self.tabBarController.tabBar.frame.size.height)];
//    __weak __typeof(self)weekSelf = self;
//    [roateView addRotateChangeBlock:^(NSInteger index) {
//        [weekSelf changeImageRoate:index];
//    }];
    [self.view addSubview:self.defaultView];
}
-(void)clickBtn:(UIButton *)clickBtn
{
    switch (clickBtn.tag) {
        case 0:
        {
            [self.navigationController popViewControllerAnimated:NO];
        }
            break;
        case 1:
        {
            [self changeImageRoate:0];
        }
            break;
        default:
        {
            if (_block) {

                _block(_imageView.image);
            }
            [self.navigationController popViewControllerAnimated:NO];
        }
            break;
    }
}
-(void)changeImageRoate:(NSInteger)index
{

    switch (index) {
        case 0:
            NSLog(@"逆时针九十度");
            _imageView.image = [_imageView.image rotate:UIImageOrientationLeft];

            break;
        case 1:
            NSLog(@"顺时针九十度");
            _imageView.image = [_imageView.image rotate:UIImageOrientationRight];

            break;
        case 2:
            NSLog(@"水平翻转");
            _imageView.image = [_imageView.image flipHorizontal];
            break;
        case 3:
            NSLog(@"上下翻转");
            _imageView.image = [_imageView.image flipVertical];
            break;
            
        default:
            break;
    }
    NSLog(@"self.rotate:%ld",(long)self.rotate);
}

-(void)addFinishBlock:(ImageBlock)block
{
    _block = block;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
