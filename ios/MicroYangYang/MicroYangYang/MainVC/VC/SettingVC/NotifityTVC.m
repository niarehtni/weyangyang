//
//  NotifityTVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-4.
//
//

#import "NotifityTVC.h"
#import "UIViewController+PWCommonMethod.h"

@interface NotifityTVC ()
{
    BOOL isBack;
}
@end

@implementation NotifityTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showBackButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    isBack = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (isBack) {
        [self showTabBar];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    isBack = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 改变事件

- (IBAction)modeSwitch:(UISwitch *)sender
{
    
}
- (IBAction)showNotify:(UISwitch *)sender
{
    
}
@end
