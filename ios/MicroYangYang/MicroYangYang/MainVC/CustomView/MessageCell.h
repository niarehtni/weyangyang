//
//  MessageCell.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import <UIKit/UIKit.h>

@class Messages;

@interface MessageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) Messages *messages;

+ (instancetype)messageCell;

+ (NSInteger)cellHeight;

@end
