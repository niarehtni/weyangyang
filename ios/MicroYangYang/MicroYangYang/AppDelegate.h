//
//  AppDelegate.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)sharedDelegate;

- (UIViewController*)topViewController;

- (void)showToast:(NSString *)text;

@end
