//
//  ImageCropViewController.m
//  FileLibraryDemo
//
//  Created by 肖兆强 on 2017/6/10.
//  Copyright © 2017年 jwzt. All rights reserved.
//

#import "ZQImageCropController.h"
#import "EditOperatingToolBar.h"
#import "ImageCropRatioChooseView.h"
#import "PECropView.h"
#import "MJHeight.h"
#import "ImageEditToolBar.h"
#define kPhotoClipper NSLocalizedString(@"图片裁剪", nil)
@interface ZQImageCropController ()<ImageEditToolBarDelegate>
{
    PECropView *_cropView;
    ImageBlock _blockImg;
    ImageCropRatioChooseView *_ratioChooseView;
    IntegerBlock _block;
}
@property(nonatomic,strong) UIView *defaultView;
@property(nonatomic,strong) UIButton *btn;
@end

@implementation ZQImageCropController
-(UIView *)defaultView
{
    if (!_defaultView) {
        _defaultView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-[MJHeight mjNaviHeight]-([MJHeight mjNaviHeight]== 64?40:60), self.view.width, [MJHeight mjNaviHeight]== 64?40:60)];
        _defaultView.backgroundColor = [UIColor blackColor];
        CGFloat margin = (self.view.frame.size.width-40-40*2);
        NSArray *titles = @[[MJHeight tz_imageNamedFromMyBundle:@"cancel"],[MJHeight tz_imageNamedFromMyBundle:@"duihao"]];
        for (int i = 0; i < titles.count; i++) {
            self.btn = [[UIButton alloc]initWithFrame:CGRectMake(i*(margin+40)+20, 0, 40, [MJHeight mjNaviHeight]== 64?40:60)];
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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [MJHeight mjNaviBarColor:self withColor:[UIColor blackColor] withAlpha:1];
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[MJHeight tz_imageNamedFromMyBundle:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(clickLeftBar)];
    self.view.backgroundColor = [UIColor blackColor];
    [self buildLayout];
}
-(void)clickLeftBar
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:NO];
}
-(void)clickBtn:(UIButton *)clickBtn
{
    switch (clickBtn.tag ) {
        case 0:
        {
            [self.navigationController popViewControllerAnimated:NO];
        }
            break;

        default:
        {
//            [self addTapBlock:^(NSInteger index) {
                if (_blockImg) {
                    _blockImg(_cropView.croppedImage);
                }
            [self.navigationController popViewControllerAnimated:NO];
//            }];
        }
            break;
    }
}
-(void)popself
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)buildLayout
{
    
    _cropView = [[PECropView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height  - ([MJHeight mjNaviHeight]== 64?40:60))];
    _cropView.image = self.image;
    _cropView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_cropView];

    [self.view addSubview:self.defaultView];

}
- (void)imageEditToolBarSelectedAtIndex:(NSInteger)index
{
    NSLog(@"index:%ld",index);
    switch (index) {
        case 0:
        {

        }
            break;

        default:
            break;
    }
    [self addFinishBlock:^(UIImage *image) {
        NSLog(@"image:%@",image);
    }];
}
-(void)changeRatio:(CGFloat)ratio
{
    [_cropView resetCropRect];
    _cropView.cropAspectRatio = ratio;
}

-(void)addFinishBlock:(ImageBlock)blockImg
{
    _blockImg = blockImg;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)addTapBlock:(IntegerBlock)block
{
    _block = block;
}
@end
