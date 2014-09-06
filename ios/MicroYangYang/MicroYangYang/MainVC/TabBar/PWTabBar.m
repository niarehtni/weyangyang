//
//  PWTabBar.m
//  13-QQ练习
//
//  Created by 潘威 on 14-6-15.
//  Copyright (c) 2014年 中晋联合技术(北京)有限公司. All rights reserved.
//

#import "PWTabBar.h"
#import "PWTabBarItem.h"


@implementation PWTabBar
{
    PWTabBarItem *lastTabBarItem;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
        self.backgroundColor = UIColorFromRGB(KTabBarBgColor);
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}

//添加tabBar的Item
- (void)addTabItem:(NSString *)title selectedImage:(NSString *)unselectedImage unselectedImage:(NSString *)selectedImage
{
    PWTabBarItem *item = [PWTabBarItem buttonWithType:UIButtonTypeCustom];
    
    [item setTitle:title forState:UIControlStateNormal];
    
    [item setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    [item setImage:[UIImage imageNamed:unselectedImage] forState:UIControlStateNormal];
    
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:item];
    
    [self adjustItem];
    
}

- (void)adjustItem
{
    NSInteger count = self.subviews.count;
    
    CGFloat itemY = 0;
    CGFloat itemH = self.bounds.size.height;
    CGFloat itemW = self.bounds.size.width/count;
    
    for (NSInteger tag = 0; tag < count; tag++) {
        PWTabBarItem *item = self.subviews[tag];
        CGFloat itemX = tag*itemW;
        item.tag = tag;
        
        item.frame = CGRectMake(itemX, itemY, itemW, itemH);
        
        if (tag == 0) {
            [self itemClick:item];
        }

    }
    
    
}

- (void)itemClick:(PWTabBarItem *)item
{
    
    if ([_delegate respondsToSelector:@selector(tabBarItemClick:fromIndex:toIndex:)]) {
        [_delegate tabBarItemClick:self fromIndex:lastTabBarItem.tag toIndex:item.tag];
    }
    lastTabBarItem.selected = NO;
    
    item.selected = YES;
    
    lastTabBarItem = item;
    
    
}

@end
