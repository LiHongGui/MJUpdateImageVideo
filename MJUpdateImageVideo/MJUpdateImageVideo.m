//
//  MJUpdateImageVideo.m
//  iDai
//
//  Created by 李宏贵 on 2019/8/8.
//  Copyright © 2019 李宏贵. All rights reserved.
//

#import "MJUpdateImageVideo.h"
#import "TZImagePickerController.h"
@interface MJUpdateImageVideo()<UINavigationControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UINavigationBarDelegate,TZImagePickerControllerDelegate>
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) NSData *imageData;
@property(nonatomic,strong) NSData *vedioData;
@end
@implementation MJUpdateImageVideo
+ (instancetype)updateManager {
    return [[[self class] alloc] init];
}
-(void)updateImageVideoView:(UIView *)customeView withVC:(UIViewController *)vc allowPickingMultipleVideo:(BOOL )allowPickingMultipleVideo
{
////    //打开照相机和图片
//    UIAlertController *sheetControler = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    CustomePickerImageVC *picker = [[CustomePickerImageVC alloc]init];
//    picker.edgesForExtendedLayout =  UIRectEdgeNone;
//    picker.automaticallyAdjustsScrollViewInsets = NO;
//    picker.allowsEditing = YES;
//    picker.delegate = self;
//    sheetControler.popoverPresentationController.sourceView = customeView;
//    sheetControler.popoverPresentationController.sourceRect = customeView.frame;
//    [self pushTZImagePickerControllerWithVC:vc allowPickingMultipleVideo:allowPickingMultipleVideo];
//    [vc presentViewController:sheetControler animated:YES completion:nil] ;
}
#pragma mark-代理:上传图片
- (void)pushTZImagePickerControllerWithVC:(UIViewController *)vc allowPickingMultipleVideo:(BOOL )allowPickingMultipleVideo successImageBlock:(SuccessImageBlock)successImageBlock{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:4 delegate:self pushPhotoPickerVc:YES allowPickingMultipleVideo:allowPickingMultipleVideo];
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    }];
     [imagePickerVc.navigationBar setBackgroundImage:[ImageColorHelper createImageWithColor:[UIColor colorWithRed:170/255.0 green:43/255.0 blue:36/255.0 alpha:1] withRect:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)] forBarMetrics:UIBarMetricsDefault];
    imagePickerVc.navigationBar.shadowImage = [ImageColorHelper createImageWithColor:[UIColor colorWithRed:170/255.0 green:43/255.0 blue:36/255.0 alpha:1] withRect:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)];
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:170/255.0 green:43/255.0 blue:36/255.0 alpha:1];
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    [imagePickerVc setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
        [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
    
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingMultipleVideo = allowPickingMultipleVideo; // 是否可以多选视频
    imagePickerVc.sortAscendingByModificationDate = YES;
    imagePickerVc.allowTakePicture = YES;
    
    imagePickerVc.showSelectBtn = YES;
    imagePickerVc.allowCrop = NO;
    imagePickerVc.needCircleCrop = NO;
    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
    imagePickerVc.showSelectedIndex = YES;
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        NSLog(@"photos:%@---assets:%@",photos,assets);
        self.image = photos[0];
        self.imageData = UIImageJPEGRepresentation(self.image, 0.6);
        //选择回调
        if (successImageBlock) {
            successImageBlock(self.imageData,self.image);
        }
        
    }];
    
    [vc presentViewController:imagePickerVc animated:YES completion:nil];
}
#pragma mark-代理:上传视频
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(PHAsset *)asset
{
    PHAssetResource * resource = [[PHAssetResource assetResourcesForAsset: asset] firstObject];

    NSString *string1 = [resource.description stringByReplacingOccurrencesOfString:@"{" withString:@""];
    NSString *string2 = [string1 stringByReplacingOccurrencesOfString:@"}" withString:@""];
    NSString *string3 = [string2 stringByReplacingOccurrencesOfString:@", " withString:@","];
    NSMutableArray *resourceArray =  [NSMutableArray arrayWithArray:[string3 componentsSeparatedByString:@" "]];
    [resourceArray removeObjectAtIndex:0];
    [resourceArray removeObjectAtIndex:0];
    
    for (NSInteger index = 0; index<resourceArray.count; index++) {
        NSString *string = resourceArray[index];
        NSString *ret = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        resourceArray[index] = ret;
    }
    
    NSMutableDictionary *videoInfo = [[NSMutableDictionary alloc] init];
    
    for (NSString *string in resourceArray) {
        NSArray *array = [string componentsSeparatedByString:@"="];
        videoInfo[array[0]] = array[1];
    }
    
    NSString *filenam = [videoInfo objectForKey:@"filename"];
    
    /*
     {
     assetLocalIdentifier = "A99AA1C3-7D59-4E10-A8D3-BF4FAD7A1BC6/L0/001";
     fileSize = 2212572;
     filename = "IMG_0049.MOV";
     size = "1080,1920";
     type = video;
     uti = "com.apple.quicktime-movie";
     }
     */
    
    PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
    options.version = PHImageRequestOptionsVersionCurrent;
    options.deliveryMode = PHVideoRequestOptionsDeliveryModeAutomatic;
    
    PHImageManager *manager = [PHImageManager defaultManager];
    [manager requestAVAssetForVideo:asset
                            options:options
                      resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
                          // asset 类型为 AVURLAsset  为此资源的fileURL
                          // <AVURLAsset: 0x283386e60, URL = file:///var/mobile/Media/DCIM/100APPLE/IMG_0049.MOV>
                          AVURLAsset *urlAsset = (AVURLAsset *)asset;
                          // 视频数据
                          self.vedioData = [NSData dataWithContentsOfURL:urlAsset.URL];
                          if (self.successVedioBlock) {
                              self.successVedioBlock(self.vedioData);
                          }
                          
                      }];
}
-(void)updateImageSuccessImage:(SuccessImageBlock)successImageBlock
{
    if (successImageBlock) {
        successImageBlock(self.imageData,self.image);
    }
    
//    if (failureImageBlock) {
//        successImageBlock(imageData);
//    }
//    if (failureVedioBlock) {
//        successVedioBlock(vedioData);
//    }
}
-(void)updateVideoSuccessVedio:(SuccessVedioBlock)successVedioBlock
{
    if (successVedioBlock) {
        successVedioBlock(self.vedioData);
    }
}
@end
