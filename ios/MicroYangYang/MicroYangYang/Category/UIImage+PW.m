//
//  UIImage+PW.m
//  13-QQ练习
//
//  Created by 潘威 on 14-6-15.
//  Copyright (c) 2014年 中晋联合技术(北京)有限公司. All rights reserved.
//

#import "UIImage+PW.h"

@implementation UIImage (PW)

+(UIImage *)stretchableImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}

+ (UIImage *)resize:(NSString *)name leftScale:(float)leftScale topScale:(float)topScale;
{
    UIImage *image = [UIImage imageNamed:name];
    
    CGFloat left = image.size.width * leftScale;
    
    CGFloat top = image.size.height * topScale;
    
    
    return [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
}

+ (UIImage *)resize:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    
    return [image stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5];
}

//iOS6使用的拉伸方法
+ (UIImage *)resize:(NSString *)name topScale:(float)topScale leftScale:(float)leftScale bottomScale:(float)bottomScale rightScale:(float)rightScale;
{
    UIImage *image = [UIImage imageNamed:name];
    
    CGFloat left = image.size.width * leftScale;
    
    CGFloat top = image.size.height * topScale;
    
    CGFloat bottom = image.size.height * bottomScale;
    
    CGFloat right = image.size.width * rightScale;
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, bottom, right) resizingMode:UIImageResizingModeStretch];
}


- (UIImage *)roundedCornerImageWithCornerRadius:(CGFloat)cornerRadius
{
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    // 防止圆角半径小于0，或者大于宽/高中较小值的一半。
    if (cornerRadius < 0)
        cornerRadius = 0;
    else if (cornerRadius > MIN(w, h))
        cornerRadius = MIN(w, h) / 2.;
    
    UIImage *image = nil;
    CGRect imageFrame = CGRectMake(0., 0., w, h);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:cornerRadius] addClip];
    [self drawInRect:imageFrame];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//缩放图片
- (UIImage *)scale:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


@end
