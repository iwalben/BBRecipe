//
//  LHLCPickPhotoManager.m
//  LHLC
//
//  Created by WalkerCloud on 2019/4/17.
//  Copyright © 2019年 Sameway. All rights reserved.
//

#import "LHLCPickPhotoManager.h"
#import "UIViewController+YBViewController.h"

@interface LHLCPickPhotoManager ()
@property (nonatomic ,copy) PickPhotoCompletion completion;
@end

static LHLCPickPhotoManager *instance;

@implementation LHLCPickPhotoManager


+ (instancetype)pick:(PickPhotoCompletion)completion{
    LHLCPickPhotoManager * p = [[LHLCPickPhotoManager alloc]init];
    p.completion = completion;
    [p alert];
    return p ;
}


- (void)alert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getPhoto:UIImagePickerControllerSourceTypeCamera];
        
    }];
    UIAlertAction *takePhotoFromAlbum = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getPhoto:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:takePhoto];
    [alert addAction:takePhotoFromAlbum];
    [alert addAction:cancel];
    alert.view.tintColor = GmColor;
    [[UIViewController topViewController]presentViewController:alert animated:YES completion:nil];
}

- (void)getPhoto:(UIImagePickerControllerSourceType)type{
    UIImagePickerController *vc = [[UIImagePickerController alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.allowsEditing = YES;
    vc.sourceType = type;
    if (type == UIImagePickerControllerSourceTypeCamera) {
        if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            vc.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        }else{
            vc.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        }
    }
    vc.delegate = self;
    [[UIViewController topViewController] presentViewController:vc animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    !self.completion?:self.completion(image,picker);
    if (@available(iOS 13.0, *)) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
