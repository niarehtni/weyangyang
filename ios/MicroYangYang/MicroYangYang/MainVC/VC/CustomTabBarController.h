//
//  CustomTabBarController.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-4.
//
//

#import <UIKit/UIKit.h>
#import "PWTabBar.h"


@interface CustomTabBarController : UITabBarController
<PWTabBarDelegate>

@property (nonatomic,strong) PWTabBar *customTabBar;

- (void)showTabBar;

- (void)hideTabBar;

@end
