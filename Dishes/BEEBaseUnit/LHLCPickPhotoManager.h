//
//  LHLCPickPhotoManager.h
//  LHLC
//
//  Created by WalkerCloud on 2019/4/17.
//  Copyright © 2019年 Sameway. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PickPhotoCompletion)(UIImage *image ,UIImagePickerController *picker);

@interface LHLCPickPhotoManager : NSObject<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

+ (instancetype)pick:(PickPhotoCompletion)completion;

@end

NS_ASSUME_NONNULL_END
