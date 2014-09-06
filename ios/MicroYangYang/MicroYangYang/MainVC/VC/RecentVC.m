//
//  RecentVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "RecentVC.h"
#import "MYYGround.h"
#import "MYYFriend.h"
#import "FriendCell.h"


@interface RecentVC ()
{
    NSMutableArray *_myGrounds;
}
@end

@implementation RecentVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createView];
    
    [self initData];
}

- (void)createView
{
    //设置NavBar不透明
    [self.navigationController.navigationBar setTranslucent:NO];

    NSArray *segArray = @[@"分组",@"最近联系人"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:segArray];
    [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
    segment.frame = CGRectMake(0, 0, 200, 30);
    segment.tintColor = [UIColor whiteColor];
    segment.selectedSegmentIndex = 0;
    self.navigationItem.titleView = segment;
}

- (void)initData
{
    _myGrounds = [NSMutableArray array];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
    
    for (NSDictionary *dict in array) {
        MYYGround *qqGroup = [MYYGround myyGroupWtihDict:dict];
        
        [_myGrounds addObject:qqGroup];
    }
    
    self.tableView.sectionHeaderHeight = 44;
}

#pragma mark - UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _myGrounds.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MYYGround *g = [_myGrounds objectAtIndex:section];
    
    return g.isOpen ? [g.friends count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:[FriendCell ID]];
    
    if (cell == nil) {
        cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[FriendCell ID]];
    }
    
    MYYGround *myyGround = [_myGrounds objectAtIndex:indexPath.section];
    
    MYYFriend *myyfriend = myyGround.friends[indexPath.row];
    
    cell.myyFriend = myyfriend;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ChatVC" sender:nil];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MYYGroundHeadView *myyGroupView = [MYYGroundHeadView myyFriendHeadView];
    
    myyGroupView.myyGroup = [_myGrounds objectAtIndex:section];
    
    myyGroupView.delegate = self;
    
    // 3.执行动画
    [UIView animateWithDuration:0.25 animations:^{
        if (myyGroupView.myyGroup.isOpen) {
            myyGroupView.myybtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else {
            myyGroupView.myybtn.imageView.transform = CGAffineTransformIdentity;
        }
    }];
    
    return myyGroupView;
}

#pragma mark - QQHeadViewDelate

- (void)clickHeadView:(MYYGroundHeadView *)headView
{
    NSInteger index = [_myGrounds indexOfObject:headView.myyGroup];
    NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:index];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
//    [self.tableView reloadData];
}


#pragma mark - 调往聊天页面

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
