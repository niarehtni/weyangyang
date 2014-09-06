//
//  MYYGround.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "MYYGround.h"
#import "MYYFriend.h"

@implementation MYYGround


- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [self init]) {
        self.name = dict[@"name"];
        self.online = [dict[@"online"] integerValue];
        
        NSMutableArray *temArray = [NSMutableArray array];
        
        NSArray *array = dict[@"friends"];
        for (NSDictionary *fDic in array) {
            MYYFriend *myyFriend = [MYYFriend friendWtihDict:fDic];
            
            [temArray addObject:myyFriend];
            
        }
        self.friends = temArray;
        
    }
    
    return self;
}

KInitM(myyGroup)

@end
