//
//  MYYConfig.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "MYYConfig.h"

@implementation MYYConfig

// 设置配置文件中的<key,value>
+(void) setValues:(NSString *)settingName Value:(NSObject *)value
{
    if(settingName == nil)
        return;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:settingName];
    [defaults synchronize];
}

//根据settingName读取配置文件中<key,value>的value
+(NSObject *) getValues:(NSString *)settingName
{
    if (settingName == nil)
        return nil;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:settingName];
}

@end
