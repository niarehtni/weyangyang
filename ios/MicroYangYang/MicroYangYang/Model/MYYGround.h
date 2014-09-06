//
//  MYYGround.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import <Foundation/Foundation.h>

@interface MYYGround : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, assign) NSInteger online;

@property (nonatomic, assign) BOOL isOpen;

KInitH(myyGroup)


@end
