//
//  CustomTabBarController.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-4.
//
//

#import "CustomTabBarController.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    _customTabBar = [[PWTabBar alloc] init];
    CGFloat tabBarX = 0;
    CGFloat tabBarH = 49;
    CGFloat tabBarW = self.view.bounds.size.width;
    CGFloat tabBarY = self.view.bounds.size.height - tabBarH;
    _customTabBar.frame = CGRectMake(tabBarX, tabBarY, tabBarW, tabBarH);
    //设置顶部可以拉伸
    _customTabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _customTabBar.delegate = self;
    
    [_customTabBar addTabItem:@"消息" selectedImage:@"ic_message_n.png" unselectedImage:@"ic_message_h.png"];
    [_customTabBar addTabItem:@"联系人" selectedImage:@"ic_contact_n.png" unselectedImage:@"ic_contact_h.png"];
    [_customTabBar addTabItem:@"设置" selectedImage:@"ic_setting_n.png" unselectedImage:@"ic_setting_h.png"];
    
    [self.view addSubview:_customTabBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideTabBar) name:KHideTabBar object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabBar) name:KShowTabBar object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KShowTabBar object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KHideTabBar object:nil];

}

#pragma mark - TabBar 委托事件


- (void)tabBarItemClick:(PWTabBar *)tabbar fromIndex:(NSInteger)fromIntex toIndex:(NSInteger)toIndex
{
    [self setSelectedIndex:toIndex];
}

#pragma mark - show and hide tab bar

- (void)showTabBar
{
    [UIView animateWithDuration:0.25 animations:^{
        CGFloat tabBarX = 0;
        CGFloat tabBarH = 49;
        CGFloat tabBarW = self.view.bounds.size.width;
        CGFloat tabBarY = self.view.bounds.size.height - tabBarH;
        self.customTabBar.frame = CGRectMake(tabBarX, tabBarY, tabBarW, tabBarH);
    }];
}

- (void)hideTabBar
{
    [UIView animateWithDuration:0.25 animations:^{
        CGFloat tabBarX = 0;
        CGFloat tabBarH = 49;
        CGFloat tabBarW = self.view.bounds.size.width;
        CGFloat tabBarY = self.view.bounds.size.height + tabBarH;
        self.customTabBar.frame = CGRectMake(tabBarX, tabBarY, tabBarW, tabBarH);
                
    }];
}

@end
