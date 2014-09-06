//
//  MYYFriend.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "MYYFriend.h"

@implementation MYYFriend

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [self init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
        self.pro = dict[@"intro"];
        self.vip = [dict[@"vip"] boolValue];
    }
    return self;
}

KInitM(friend)

@end
