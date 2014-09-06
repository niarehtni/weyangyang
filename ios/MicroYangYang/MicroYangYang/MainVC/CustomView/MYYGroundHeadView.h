//
//  MYYGroundHeadView.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import <UIKit/UIKit.h>

@class MYYGround,MYYGroundHeadView;

@protocol MYYGroupDelegate <NSObject>

@optional

- (void)clickHeadView:(MYYGroundHeadView *)headView;

@end

@interface MYYGroundHeadView : UIView


@property (nonatomic ,strong) MYYGround *myyGroup;

@property (weak, nonatomic) IBOutlet UIButton *myybtn;

@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;


@property (nonatomic, strong) id <MYYGroupDelegate> delegate;

+ (id)myyFriendHeadView;

- (IBAction)myybtnClicked:(UIButton *)sender;

@end
