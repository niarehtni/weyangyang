//
//  AssistTVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import "AssistTVC.h"
#import "UIViewController+PWCommonMethod.h"


@interface AssistTVC ()
{
    NSArray *_tipArray;
}
@end

@implementation AssistTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    _tipArray = @[@"确认要清空微客服本地的所有缓存数据?",
                  @"清空消息列表后，所有接入对话均会被关闭，确定要清空消息列表?",
                  @"清空后只能在pc上查找，确认要清空最近联系人?",
                  @"确认要清空微客服本地的所有聊天记录?",
                  @"确认要清空本机所有常用语?"];
    [self showBackButton];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self showTabBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView 委托

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        cell.textLabel.textColor = UIColorFromRGB(KNavBarBgColor);
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [self showAction:cell.textLabel.text index:indexPath.row];
    }
}

- (void)showAction:(NSString *)messege index:(NSInteger)index
{
    NSString *title = _tipArray[index];
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:messege otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

#pragma mark- UIActionSheet委托

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

@end
