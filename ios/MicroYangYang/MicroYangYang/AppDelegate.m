//
//  AppDelegate.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "AppDelegate.h"
#import "MYYConfig.h"
#import "GuideVC.h"
#import <ALToastView/ALToastView.h>
#import "UIImage+PW.h"

@implementation AppDelegate

+ (AppDelegate *)sharedDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
    [navBar setTitleTextAttributes:@{
                                     NSFontAttributeName:[UIFont systemFontOfSize:20],
                                     UITextAttributeTextColor:[UIColor whiteColor]
                                     }];
    if (kSystemVersion >= 7.0) {
        [application setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }

    [application setStatusBarHidden:NO];

    BOOL isFirstLogin = (BOOL)[MYYConfig getValues:KiSFirstLogin];
    if (!isFirstLogin)
    {
        GuideVC *guideVC = [[GuideVC alloc] init];
        self.window.rootViewController = guideVC;
        isFirstLogin = YES;
        [MYYConfig setValues:KiSFirstLogin Value:[NSNumber numberWithBool:isFirstLogin]];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - 

- (UIViewController*)topViewController
{
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}


- (void)showToast:(NSString *)text
{
    [ALToastView toastInView:self.window withText:text];
}

@end
