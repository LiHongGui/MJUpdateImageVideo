//
//  TZEditPhotoVC.m
//  222
//
//  Created by 李宏贵 on 2020/1/6.
//  Copyright © 2020 李宏贵. All rights reserved.
//

#import "TZEditPhotoVC.h"
#import "TZEditBar.h"
@interface TZEditPhotoVC ()
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UIScrollView *scrollView;
@end

@implementation TZEditPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.8];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupUI];
}
-(void)setupUI
{

    CGFloat navH = self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-navH*2)];
    [self.view addSubview:self.scrollView];
    CGFloat imageSC = self.image.size.height*self.view.frame.size.width/self.image.size.width+navH;
    self.scrollView.contentSize = CGSizeMake(0, imageSC);

    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, imageSC)];
    self.imageView.userInteractionEnabled = YES;
    NSLog(@"image:%@---imageSC:%f---self.view.frame.size.width:%f---navH:%f",_image,imageSC,self.view.frame.size.width,navH);
    _imageView.image = _image;

    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollView addSubview:self.imageView];

    TZEditBar *bottomBar = [[TZEditBar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-navH*2, self.view.frame.size.width, navH)];
    [self.view addSubview:bottomBar];
}

@end
