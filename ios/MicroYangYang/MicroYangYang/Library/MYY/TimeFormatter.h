//
//  TimeFormatter.h
//  WisdomMap
//
//  Created by 中晋联合技术(北京)有限公司 on 14-3-19.
//  Copyright (c) 2014年 ZJKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeFormatter : NSObject

+(NSMutableArray *)getStringFromNSDate:(NSDate *)date; //将时间NSDate类型转化为字符串格式分别输出0为dateString和1为timeString

+(NSDate *)getDateTimeFromMilliSeconds:(long long) miliSeconds;//为了兼容java版本，事件是从19701/1/1开始

+(long long)getDateTimeTOMilliSeconds:(NSDate *)datetime;//将NSDate类型的时间转换为NSInteger类型

// 将时间段划分成一天一天的时间数组
+(NSMutableArray *)createDateSegment:(NSDate *)begainDate endDate:(NSDate *)endDate;

//把时间2014-07-16 09:09:09 转换为 YYMMDDHHmmss 140716090909
+ (NSString *)getDateStrFromDate:(NSDate *)date;

+ (NSString *)getDateStrFromDate:(NSDate *)date time:(NSDate *)time;

//把时间字符串YYMMDDHHmmss 140716090909 转换为时间 2014-07-16 09:09:09
+ (NSDate *)getDateTimeFromDateStr:(NSString *)dateStr;

+ (NSString *)getStringFromDate:(NSDate *)date;

//获得时间2014-08-08
+ (NSString *)getDate:(NSDate *)date;

//获得时间11:27:30
+ (NSString *)getTime:(NSDate *)time;

+ (long long)getDateTimeToMilliSeconds:(NSDate *)startDate time:(NSDate *)time;

//把字符串转化为LongLong类型的
+ (long long)getLonglongByTimeStr:(NSString *)timer;

//把时间转换为8月15日 18:30
+ (NSString *)getTimeStr:(NSDate *)date;

//2014-10-10 10-10 ->2014-10-10 10:10
+ (NSString *)getDateForData:(NSDate *)date;

//10-10 ->10月10号
+ (NSString *)getChinaMonthForData:(NSDate *)date;

@end
