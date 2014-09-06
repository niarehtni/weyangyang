//
//  PWTabBar.h
//  13-QQ练习
//
//  Created by 潘威 on 14-6-15.
//  Copyright (c) 2014年 中晋联合技术(北京)有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PWTabBar,PWTabBarItem;

@protocol PWTabBarDelegate <NSObject>

@optional

- (void)tabBarItemClick:(PWTabBar *)tabbar fromIndex:(NSInteger)fromIntex toIndex:(NSInteger)toIndex;

@end

@interface PWTabBar : UIView

@property (nonatomic, weak) id <PWTabBarDelegate> delegate;

//添加tabBar的Item
- (void)addTabItem:(NSString *)title selectedImage:(NSString *)selectedImage unselectedImage:(NSString *)unselectedImage;



@end
