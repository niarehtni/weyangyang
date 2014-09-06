//
//  MYYGroundHeadView.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "MYYGroundHeadView.h"
#import "MYYGround.h"

@implementation MYYGroundHeadView

+ (id)myyFriendHeadView
{
    MYYGroundHeadView *myyHeadView = [[[NSBundle mainBundle] loadNibNamed:@"MYYGroundHeadView" owner:nil options:nil] lastObject];
    
    myyHeadView.myybtn.imageView.contentMode = UIViewContentModeCenter;
    myyHeadView.myybtn.imageView.clipsToBounds = NO;
    
    return myyHeadView;
}

- (void)setMyyGroup:(MYYGround *)myyGroup
{
    _myyGroup = myyGroup;
    
    [_myybtn setTitle:_myyGroup.name forState:UIControlStateNormal];
    _onlineLabel.text = [NSString stringWithFormat:@"%d/%d",_myyGroup.online,_myyGroup.friends.count];
    
}

- (IBAction)myybtnClicked:(UIButton *)sender
{
    _myyGroup.isOpen = !_myyGroup.isOpen;
    
    
    if ([_delegate respondsToSelector:@selector(clickHeadView:)]) {
        [_delegate clickHeadView:self];
    }
    else
    {
        NSLog(@"没有实现委托");
    }
    
    // 在这里写没有用的，因为点击之后又重新刷新了表格
//    [UIView animateWithDuration:0.25 animations:^{
//        if (_myyGroup.isOpen) {
//            _myybtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
//        } else {
//            _myybtn.imageView.transform = CGAffineTransformIdentity;
//        }
//    }];
}


@end
