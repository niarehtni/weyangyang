//
//  ManagerGroundTVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import "ManagerGroundTVC.h"
#import "UIViewController+PWCommonMethod.h"


@interface ManagerGroundTVC ()

@end

@implementation ManagerGroundTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self showBackButton];
    
    [self showRightBtnWithImage:@"ic_plus"];
    
    [self setExtraCellLineHidden:self.tableView];
}

- (void)rightBtnPressed:(UIBarButtonItem *)btnItem
{
    [self performSegueWithIdentifier:@"EditGroundVC" sender:nil];
}

//隐藏多余的分割线
- (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableHeaderView:view];
    [tableView setTableFooterView:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
