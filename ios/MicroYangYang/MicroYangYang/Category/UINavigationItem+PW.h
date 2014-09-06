//
//  UINavigationItem+PW.h
//  13-QQ练习
//
//  Created by 潘威 on 14-6-15.
//  Copyright (c) 2014年 中晋联合技术(北京)有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (PW)

- (void)copyFromOther:(UINavigationItem *)other;

+ (void)copyFromOtheToItem:(UINavigationItem *)other to:(UINavigationItem *)toItem;;

@end
