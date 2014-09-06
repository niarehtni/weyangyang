//
//  FriendCell.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import <UIKit/UIKit.h>

@class MYYFriend;

@interface FriendCell : UITableViewCell

@property (nonatomic, strong) MYYFriend *myyFriend;

+(NSString *)ID;

@end
