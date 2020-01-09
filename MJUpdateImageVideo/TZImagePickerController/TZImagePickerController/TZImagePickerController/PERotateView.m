//
//  PERotateView.m
//  222
//
//  Created by 李宏贵 on 2020/1/9.
//  Copyright © 2020 李宏贵. All rights reserved.
//

#import "PERotateView.h"
#import "ZQUtil.h"
#import "UIImage+Rotate.h"
@interface PERotateView()
{
    UIImageView *_imageView;
    ImageBlock _block;
}
@end
@implementation PERotateView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        [self buildLayout];
    }
    return self;
}
-(void)buildLayout
{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _imageView.image = self.image;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageView];
}
- (void)setImage:(UIImage *)image
{
    _image = image;
    _imageView.image = image;
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
}

-(void)addFinishBlock:(ImageBlock)block
{
    _block = block;
}
@end
