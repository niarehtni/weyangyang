//
//  MessageCell.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "MessageCell.h"
#import "Messages.h"


@implementation MessageCell


+ (instancetype)messageCell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:nil options:nil] lastObject];
}

+ (NSInteger)cellHeight
{
    return 60;
}

- (void)setMessages:(Messages *)messages
{
    _messages = messages;
    _image.layer.cornerRadius = _image.bounds.size.width / 2;
//    _image.image = [UIImage imageNamed:_messages.img];
    _titleLabel.text = _messages.title;
}

@end
