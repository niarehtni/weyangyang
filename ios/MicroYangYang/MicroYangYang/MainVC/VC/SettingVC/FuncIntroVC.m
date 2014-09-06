//
//  FuncIntroVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import "FuncIntroVC.h"
#import "UIViewController+PWCommonMethod.h"

#define KGudieVCCount 3


@interface FuncIntroVC ()
{
    UIScrollView *scrollView;
}
@end

@implementation FuncIntroVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showBackButton];
    
    [self createSubViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createSubViews
{
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height*KGudieVCCount);
    scrollView.bounces = YES;
    scrollView.pagingEnabled = NO;
    scrollView.clipsToBounds = NO;
    [self.view addSubview:scrollView];
    
    //创建指导页
    [self createScrollViewSubViews];
}

- (void)createScrollViewSubViews
{
    for (int i = 0; i < KGudieVCCount; i ++) {
        
        NSString * imageName = [NSString stringWithFormat:@"wyy_gn_%.02d.jpg", i+1];
        UIImageView * oneImageView = [[UIImageView alloc] init];
        oneImageView.contentMode = UIViewContentModeScaleAspectFill;
        oneImageView.frame = CGRectMake(0, self.view.frame.size.height*i, kScreenWidth, kScreenHeight);
        oneImageView.backgroundColor = [UIColor clearColor];
        oneImageView.image = [UIImage imageNamed:imageName];
        
        [scrollView addSubview:oneImageView];
    }
}


@end
