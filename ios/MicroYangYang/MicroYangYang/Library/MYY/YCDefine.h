//
//  YCDefine.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#ifndef MicroYangYang_YCDefine_h
#define MicroYangYang_YCDefine_h

#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height
#define kSystemVersion  [[[UIDevice currentDevice] systemVersion] floatValue]


#define KInitH(name) - (id)initWithDict:(NSDictionary *)dict;\
+ (id)name##WtihDict:(NSDictionary *)dict;//##是宏定义的连接符号

#define KInitM(name) + (id)name##WtihDict:(NSDictionary *)dict\
{\
return [[self alloc] initWithDict:dict];\
}

#define ZJLog(format, ...)  NSLog(format, ## __VA_ARGS__)


//颜色宏定义
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define KTabBarBgColor 0xf5f5f5
#define KNavBarBgColor 0x008058

//是否是第一次登录
#define KiSFirstLogin @"isFirstLogin"

//隐藏TabBar
#define KHideTabBar @"hideTabBar"
//显示TabBar
#define KShowTabBar @"showTabBar"

#endif
