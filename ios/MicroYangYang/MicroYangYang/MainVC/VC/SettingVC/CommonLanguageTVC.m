//
//  CommonLanguageTVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import "CommonLanguageTVC.h"
#import "UIViewController+PWCommonMethod.h"


@interface CommonLanguageTVC ()

@end

@implementation CommonLanguageTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showBackButton];
    
    [self showRightButton];
    
    [self setExtraCellLineHidden:self.tableView];
}

//重写返回方法
- (void)backBarButtonPressed:(UIBarButtonItem *)item
{
    [self showTabBar];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

- (void)showRightButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setImage:[UIImage imageNamed:@"ic_more.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showMore) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)showMore
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"管理分组",@"新建常用语", nil];
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 2) {
        return;
    }
    NSString *identify = nil;
    switch (buttonIndex)
    {
        case 0:
            identify = @"MGTVC";
            break;
        case 1:
            
            break;
    }
    
    [self performSegueWithIdentifier:identify sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
