//
//  AboutTVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import "AboutTVC.h"
#import "UIViewController+PWCommonMethod.h"
#import "GuideVC.h"
#import "AppDelegate.h"

@interface AboutTVC ()
{
    BOOL isLeave;//是否离开关于页面
}
@end

@implementation AboutTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self showBackButton];
    isLeave = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (isLeave) {
        [self showTabBar];
    }
}

- (void)initView
{
    _vesonTip.textColor = UIColorFromRGB(KNavBarBgColor);
    [_caseBtn setTitleColor:UIColorFromRGB(KNavBarBgColor) forState:UIControlStateNormal];
    [_linkBtn setTitleColor:UIColorFromRGB(KNavBarBgColor) forState:UIControlStateNormal];
    _spliteLabel.backgroundColor = UIColorFromRGB(KNavBarBgColor);
    _bottomView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView 委托事件

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    isLeave = NO;
    if (indexPath.row == 1)
    {
        [self showGuidePage];
    }
}

- (void)showGuidePage
{
    GuideVC *guideVC = [[GuideVC alloc] init];
    
    [self presentViewController:guideVC animated:NO completion:nil];

    
    guideVC.view.alpha = 0.8;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.5];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    guideVC.view.alpha = 1.0;
    
    [UIView commitAnimations];
    
}

#pragma mark - 点击事件

- (IBAction)caseBtnClicked
{
    
}

- (IBAction)linkBtnClicked
{
    
}
@end
