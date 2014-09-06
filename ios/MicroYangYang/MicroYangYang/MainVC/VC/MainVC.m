//
//  MainVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "MainVC.h"
#import "MessageVC.h"
#import "RecentVC.h"
#import "SettingVC.h"
#import "UIImage+PW.h"
#import "UINavigationItem+PW.h"


@interface MainVC ()
{
    PWTabBar *_tabBar;
}
@end

@implementation MainVC


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    MessageVC *messageVC = [[MessageVC alloc] init];
    RecentVC *recentVC = [[RecentVC alloc] init];
    SettingVC *settingVC = [[SettingVC alloc] init];
    
    [self addChildViewController:messageVC];
    [self addChildViewController:recentVC];
    [self addChildViewController:settingVC];
    
    PWTabBar *tabBar = [[PWTabBar alloc] init];
    CGFloat tabBarX = 0;
    CGFloat tabBarH = 49;
    CGFloat tabBarW = self.view.bounds.size.width;
    CGFloat tabBarY = self.view.bounds.size.height - tabBarH;
    tabBar.frame = CGRectMake(tabBarX, tabBarY, tabBarW, tabBarH);
    //设置顶部可以拉伸
    tabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
//    [tabBar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_bg.png"]]];
    tabBar.delegate = self;
    [self.view addSubview:tabBar];
    _tabBar = tabBar;
    
    [tabBar addTabItem:@"消息" selectedImage:@"ic_message_n.png" unselectedImage:@"ic_message_h.png"];
    [tabBar addTabItem:@"联系人" selectedImage:@"ic_contact_n.png" unselectedImage:@"ic_contact_h.png"];
    [tabBar addTabItem:@"设置" selectedImage:@"ic_setting_n.png" unselectedImage:@"ic_setting_h.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TabBar 委托事件

- (void)tabBarItemClick:(PWTabBar *)tabbar fromIndex:(NSInteger)fromIntex toIndex:(NSInteger)toIndex
{
    //先取出当前的View
    UIViewController *viewContrller = self.childViewControllers[fromIntex];
    //移除当前的View
    [viewContrller.view removeFromSuperview];
    
    CGFloat viewY = 0;
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        viewY = 64;
        
    }
    
    UIViewController *curentViewContrller = self.childViewControllers[toIndex];
    CGFloat viewH = self.view.bounds.size.height - _tabBar.bounds.size.height - viewY;
    CGFloat viewW = self.view.bounds.size.width;
    
    
    
    curentViewContrller.view.frame = CGRectMake(0, viewY, viewW, viewH);
    
    
    [self.view addSubview:curentViewContrller.view];
    
    
    [UINavigationItem copyFromOtheToItem:curentViewContrller.navigationItem to:self.navigationItem];
    
    
}


@end
