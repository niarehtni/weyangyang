//
//  UIViewController+PWCommonMethod.m
//  RaggedKing
//
//  Created by 潘威 on 14-8-15.
//  Copyright (c) 2014年 pw. All rights reserved.
//

#import "UIViewController+PWCommonMethod.h"
#import <MBProgressHUD.h>
#import "AppDelegate.h"

@implementation UIViewController (PWCommonMethod)

- (void)showProgressHUD
{
    [self hideProgressHUD];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideProgressHUD
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)pwPushViewController:(UIViewController *)viewController {
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3f];
    [animation setType:kCATransitionReveal];
    [animation setSubtype:kCATransitionFromTop];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [[viewController.view layer] addAnimation:animation forKey:@"PWPushTop"];
    [self.navigationController pushViewController:viewController animated:NO];
}

- (void)pwPopViewController:(UIViewController *)viewController {
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3f];
    [animation setType:kCATransitionReveal];
    [animation setSubtype:kCATransitionFromTop];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [[viewController.view layer] addAnimation:animation forKey:@"PWPopBottom"];
    [self.navigationController popViewControllerAnimated:NO];
}



- (void)showBackButton
{
    UIButton *button = [self createBackButton];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(backBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barItem;
    
    [self hideTabBar];
}

- (void)backBarButtonPressed:(UIBarButtonItem *)item
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showRightButton:(NSString *)title
{
    UIButton *button = [self createButtonWithTitle:title];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(rightBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (void)showRightBtnWithImage:(NSString *)imageName;
{
    UIButton *button = [self createButtonWithImage:imageName];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(rightBtnPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (UIButton *)createButtonWithTitle:(NSString *)title
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:18]];
    CGSize size = [title sizeWithFont:button.titleLabel.font];
    button.frame = CGRectMake(0, 0, size.width, 30);
    return button;
}

- (UIButton *)createButtonWithImage:(NSString *)imageName
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 40, 40);
    return button;
}

- (UIButton *)createBackButton
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
    [button setImage:[UIImage imageNamed:@"ic_back.png"] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(5, -10, 5, 0)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    return button;
}

- (void)showNavBg:(NSString *)title
{
    UIImage *image = [[UIImage imageNamed:@"navbar_bg.png"] scale:CGSizeMake(self.view.frame.size.width, 72)];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.text = title;
    self.navigationItem.titleView = titleLabel;
    
}

- (void)hideTabBar
{
    [[NSNotificationCenter defaultCenter] postNotificationName:KHideTabBar object:nil];
}

- (void)showTabBar
{
    [[NSNotificationCenter defaultCenter] postNotificationName:KShowTabBar object:nil];
}

@end
