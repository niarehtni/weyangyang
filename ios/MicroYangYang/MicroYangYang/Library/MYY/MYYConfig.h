//
//  MYYConfig.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import <Foundation/Foundation.h>

@interface MYYConfig : NSObject

+(void) setValues:(NSString *)settingName Value:(NSObject *)value;

+(NSObject *) getValues:(NSString *)settingName;

@end
