//
//  UIViewController+PWCommonMethod.h
//  RaggedKing
//
//  Created by 潘威 on 14-8-15.
//  Copyright (c) 2014年 pw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PWCommonMethod)

- (void)showNavBg:(NSString *)title;

- (void)showProgressHUD;
- (void)hideProgressHUD;

//从底部push进入
- (void)pwPushViewController:(UIViewController *)viewController;
//从顶部pop回来
- (void)pwPopViewController:(UIViewController *)viewController;

- (void)showBackButton;

- (void)backBarButtonPressed:(UIBarButtonItem *)item;

- (void)showRightButton:(NSString *)title;

- (void)rightBarButtonPressed:(UIBarButtonItem *)btnItem;

- (void)showRightBtnWithImage:(NSString *)imageName;

- (void)rightBtnPressed:(UIBarButtonItem *)btnItem;

- (void)hideTabBar;

- (void)showTabBar;

@end
