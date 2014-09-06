//
//  MessageVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "MessageVC.h"
#import "Messages.h"
#import "MessageCell.h"
#import "OrderVC.h"

@interface MessageVC ()
{
    NSMutableArray *_messages;
}
@end

@implementation MessageVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"消息";
    
    [self createView];
    
    [self initData];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
}

#pragma mark - 添加子视图

- (void)createView
{
    //设置NavBar不透明
    [self.navigationController.navigationBar setTranslucent:NO];
    
    NSArray *segArray = @[@"消息",@"标记"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:segArray];
    [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
    segment.frame = CGRectMake(0, 0, 200, 30);
    segment.tintColor = [UIColor whiteColor];
    segment.selectedSegmentIndex = 0;
    self.navigationItem.titleView = segment;
}

- (void)initData
{
    _messages = [NSMutableArray arrayWithCapacity:10];
    
    for (NSInteger index = 0; index < 10; index ++)
    {
        Messages *ms = [[Messages alloc] init];
        ms.title = [NSString stringWithFormat:@"消息%d",index];
        [_messages addObject:ms];
    }
    
    [self.tableView reloadData];
}

#pragma mark - UITableview 委托方法和数据源方法

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MessageCell cellHeight];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"MessageCell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (cell == nil) {
        cell = [MessageCell messageCell];
        cell.messages = _messages[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"OrderVC" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 调往下一个页面

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    OrderVC *orderVC = segue.destinationViewController;
    
}


@end
