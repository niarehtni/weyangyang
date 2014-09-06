//
//  UINavigationItem+PW.m
//  13-QQ练习
//
//  Created by 潘威 on 14-6-15.
//  Copyright (c) 2014年 中晋联合技术(北京)有限公司. All rights reserved.
//

#import "UINavigationItem+PW.h"

@implementation UINavigationItem (PW)

- (void )copyFromOther:(UINavigationItem *)other
{
    self.leftBarButtonItem = other.leftBarButtonItem;
    self.leftBarButtonItems = other.leftBarButtonItems;
    self.rightBarButtonItem = other.rightBarButtonItem;
    self.rightBarButtonItems = other.rightBarButtonItems;
    self.title = other.title;
    self.titleView = other.titleView;
}

+ (void )copyFromOtheToItem:(UINavigationItem *)other to:(UINavigationItem *)toItem
{
     [toItem copyFromOther:other];
}

@end
