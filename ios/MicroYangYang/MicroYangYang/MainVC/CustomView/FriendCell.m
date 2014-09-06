//
//  FriendCell.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "FriendCell.h"
#import "MYYFriend.h"

@implementation FriendCell

- (void)setMyyFriend:(MYYFriend *)myyFriend
{
    _myyFriend = myyFriend;
    
    self.textLabel.text = myyFriend.name;
    self.detailTextLabel.text = myyFriend.pro;
    
    self.imageView.image = [UIImage imageNamed:myyFriend.icon];
    
    self.textLabel.textColor = myyFriend.vip ? [UIColor redColor] : [UIColor blackColor];
}

+ (NSString *)ID
{
    return @"MYYCell";
}


@end
