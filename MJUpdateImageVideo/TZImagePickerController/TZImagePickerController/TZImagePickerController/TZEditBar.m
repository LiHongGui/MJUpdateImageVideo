//
//  TZEditBar.m
//  222
//
//  Created by 李宏贵 on 2020/1/6.
//  Copyright © 2020 李宏贵. All rights reserved.
//

#import "TZEditBar.h"
#import "NSBundle+TZImagePicker.h"
@interface TZEditBar()
@property(nonatomic,strong) UIButton *btn;
@property(nonatomic,strong) UIView *defaultView;
@property(nonatomic,strong) UIView *cropView;
@property(nonatomic,strong) UIView *rotateView;
@property(nonatomic,strong) NSArray *titles;
@end
@implementation TZEditBar
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.defaultView];
        [self addSubview:self.cropView];
        [self addSubview:self.rotateView];
        [self setupUI:0];
        self.backgroundColor = [UIColor blackColor];
//        self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.8];
    }
    return self;
}
-(NSArray *)titles
{
    if (_titles) {
        _titles = [NSArray array];
    }
    return _titles;
}
-(UIView *)defaultView
{
    if (!_defaultView) {
        _defaultView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:_defaultView];
        _defaultView.tag = 0;
        _titles = @[@"取消",@"裁剪",@"旋转",@"完成"];
        CGFloat w = [UIScreen mainScreen].bounds.size.width/_titles.count;
        for (int i = 0; i < _titles.count; i++) {
            self.btn = [[UIButton alloc]initWithFrame:CGRectMake(i*w, 0, w, self.frame.size.height)];
            [_defaultView addSubview:self.btn];
            [self.btn setTitle:_titles[i] forState:UIControlStateNormal];
            self.btn.tag = i;
            self.btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [self.btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.btn addTarget: self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return _defaultView;
}
-(UIView *)cropView
{
    if (!_cropView) {
        _cropView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:_cropView];
        _cropView.tag = 1;
        _titles = @[@"取消",@"还原",@"完成"];
        CGFloat w = [UIScreen mainScreen].bounds.size.width/_titles.count;
        for (int i = 0; i < _titles.count; i++) {
            self.btn = [[UIButton alloc]initWithFrame:CGRectMake(i*w, 0, w, self.frame.size.height)];
            [_cropView addSubview:self.btn];
            [self.btn setTitle:_titles[i] forState:UIControlStateNormal];
            self.btn.tag = i;
            self.btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [self.btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.btn addTarget: self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return _cropView;
}
-(UIView *)rotateView
{
    if (!_rotateView) {
        _rotateView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:_rotateView];
        _rotateView.tag = 2;
        _titles = @[@"取消",@"旋转",@"完成"];
        CGFloat w = [UIScreen mainScreen].bounds.size.width/_titles.count;
        for (int i = 0; i < _titles.count; i++) {
            self.btn = [[UIButton alloc]initWithFrame:CGRectMake(i*w, 0, w, self.frame.size.height)];
            [_rotateView addSubview:self.btn];
            [self.btn setTitle:_titles[i] forState:UIControlStateNormal];
            self.btn.tag = i;
            self.btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [self.btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.btn addTarget: self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return _rotateView;
}
-(void)setupUI:(NSInteger )tag
{

    if (tag == 0) {
        self.defaultView.hidden = NO;
        self.cropView.hidden = YES;
        self.rotateView.hidden = YES;
    }else if (tag == 1) {
        self.defaultView.hidden = YES;
        self.cropView.hidden = NO;
        self.rotateView.hidden = YES;
    }else if (tag == 2) {
        self.defaultView.hidden = YES;
        self.cropView.hidden = YES;
        self.rotateView.hidden = NO;
    }

}

-(void)changeUI:(NSInteger )tag
{
    [self removeFromSuperview];
    if (tag == 1) {
//        [self setupUI];
    }
}
-(void)removeFromSuperviews
{
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {

            UIButton *btn = (UIButton *)obj;
            if (btn.tag > 0) {
                [btn removeFromSuperview];
            }
        }
    }
}
-(void)clickBtn:(UIButton *)clickBtn
{
    if ([self.delegate respondsToSelector:@selector(tzEditBar:withClickEditBtn:)]) {
        [self.delegate tzEditBar:self withClickEditBtn:clickBtn];
    }
}
- (UIImage *)tz_imageNamedFromMyBundle:(NSString *)name {
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
@end
