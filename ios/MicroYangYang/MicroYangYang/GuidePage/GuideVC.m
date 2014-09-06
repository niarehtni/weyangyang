//
//  GuideVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "GuideVC.h"
#import "AppDelegate.h"
#import "LoginVC.h"
#import "MYYConfig.h"

#define KGudieVCCount 3

@interface GuideVC ()

@end

@implementation GuideVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self createSubViews];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Load UI Method

- (void)createSubViews
{
    CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(kScreenWidth*KGudieVCCount, 0);
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.clipsToBounds = NO;
    [self.view addSubview:scrollView];
    
    //创建指导页
    [self createScrollViewSubViews];
}

- (void)createScrollViewSubViews
{
    for (int i = 0; i < KGudieVCCount; i ++) {
        
        NSString * imageName = [NSString stringWithFormat:@"splash%d", i+1];
        UIImageView * oneImageView = [[UIImageView alloc] init];
        oneImageView.contentMode = UIViewContentModeScaleAspectFill;
        oneImageView.frame = CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight);
        
        if (i == 2) {
            oneImageView.userInteractionEnabled = YES;
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(40, kScreenHeight - 70, 240, 40);
            [button addTarget:self
                       action:@selector(startMYY)
             forControlEvents:UIControlEventTouchDown];
            [oneImageView addSubview:button];
        }
        
        oneImageView.backgroundColor = [UIColor clearColor];
        oneImageView.image = [UIImage imageNamed:imageName];
        
        [scrollView addSubview:oneImageView];
    }
}

#pragma mark - UIButtonAction
- (void)startMYY
{
    BOOL isFirstLogin = (BOOL)[MYYConfig getValues:KiSFirstLogin];
    if (!isFirstLogin)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login"
                                                             bundle:nil];
        LoginVC * loginVC = [storyboard instantiateInitialViewController];
        AppDelegate * appdelegate = [AppDelegate sharedDelegate];
        appdelegate.window.rootViewController = loginVC;
    }
    else
    {
        
        [self dismissViewControllerAnimated:NO completion:nil];
        
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        
        [UIView beginAnimations:nil context:nil];
        
        [UIView setAnimationDuration:0.5];
        
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        [UIView commitAnimations];
        
    }
}

@end
