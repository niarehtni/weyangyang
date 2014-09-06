//
//  UIImage+PW.h
//  13-QQ练习
//
//  Created by 潘威 on 14-6-15.
//  Copyright (c) 2014年 中晋联合技术(北京)有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PW)

+ (UIImage *)stretchableImage:(NSString *)imageName;

+ (UIImage *)resize:(NSString *)name leftScale:(float)leftScale topScale:(float)topScale;

+ (UIImage *)resize:(NSString *)name;

//iOS6使用的拉伸方法
+ (UIImage *)resize:(NSString *)name topScale:(float)topScale leftScale:(float)leftScale bottomScale:(float)bottomScale rightScale:(float)rightScale;

- (UIImage *)roundedCornerImageWithCornerRadius:(CGFloat)cornerRadius;

//缩放图片
- (UIImage *)scale:(CGSize)size;

@end
