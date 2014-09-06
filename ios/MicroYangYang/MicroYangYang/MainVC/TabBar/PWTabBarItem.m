//
//  PWTabBarItem.m
//  13-QQ练习
//
//  Created by 潘威 on 14-6-15.
//  Copyright (c) 2014年 中晋联合技术(北京)有限公司. All rights reserved.
//

#import "PWTabBarItem.h"

#define KImageScale 0.6

@implementation PWTabBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置文字的大小
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        //设置文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //设置图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setTitleColor:UIColorFromRGB(KNavBarBgColor) forState:UIControlStateSelected];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    return self;
}

#pragma mark 当按钮达到高亮状态的时候会调用，并且默认会在这个方法中进行高亮处理

- (void)setHighlighted:(BOOL)highlighted{}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height*KImageScale;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height*KImageScale;
    
    return CGRectMake(0, 3, imageW, imageH);
    
}


@end
