//
//  TimeFormatter.m
//  WisdomMap
//
//  Created by 中晋联合技术(北京)有限公司 on 14-3-19.
//  Copyright (c) 2014年 ZJKJ. All rights reserved.
//

#import "TimeFormatter.h"

@implementation TimeFormatter

//将时间NSDate类型转化为字符串格式分别输出dateStr和timeStr
+(NSMutableArray *)getStringFromNSDate:(NSDate *)date
{
    if (date == nil)
        return nil;
    NSMutableArray *dateTimeArray = [NSMutableArray arrayWithCapacity:2];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate:date];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *timeString = [formatter stringFromDate:date];
    //    方法二
    //    NSString *dateDescription = [date description];
    //    NSString *dateString = [dateDescription substringToIndex:10];
    //    NSRange timeRange = [dateDescription rangeOfString:@" "];
    //    timeRange.location +=1;
    //    timeRange.length +=4;
    //    NSString *timeString = [dateDescription substringWithRange:timeRange];
    [dateTimeArray addObject:dateString];
    [dateTimeArray addObject:timeString];
    return dateTimeArray;
}

//为了兼容java版本，事件是从1970/1/1开始
+(NSDate *)getDateTimeFromMilliSeconds:(long long) miliSeconds
{
    NSTimeInterval oneMinute=1000.0;
    NSTimeInterval seconds = miliSeconds /oneMinute;
    return [NSDate dateWithTimeIntervalSince1970:seconds];
}

//将NSDate类型的时间转换为long long类型,从1970/1/1开始
+(long long)getDateTimeTOMilliSeconds:(NSDate *)datetime
{
    NSTimeInterval interval = [datetime timeIntervalSince1970];
    // NSTimeInterval返回的是double类型，输出会显示为10位整数加小数点加一些其他值
    // 如果想转成int型，必须转成long long型才够大。
    long long millisecond = [[NSNumber numberWithDouble:interval] longLongValue] * 1000; // 将double转为long long型
    return millisecond;
}

+ (long long)getDateTimeToMilliSeconds:(NSDate *)startDate time:(NSDate *)time
{
    NSString *dateStr = [NSString stringWithFormat:@"%@ %@",[self getDate:startDate],[self getTime:time]];
    NSDate *date = [self getDateTimeFromDateStr:dateStr];
    return [self getDateTimeTOMilliSeconds:date];
}

//获得时间2014-08-08
+ (NSString *)getDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd";
    return [formatter stringFromDate:date];
}

//获得时间11:27:30
+ (NSString *)getTime:(NSDate *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm:ss";
    return [formatter stringFromDate:time];
}

// 将时间段划分成一天一天的时间数组
+(NSMutableArray *)createDateSegment:(NSDate *)begainDate endDate:(NSDate *)endDate
{
    NSMutableArray *arrayDays = [NSMutableArray arrayWithCapacity:7];
    NSTimeInterval oneDay = 24*60*60;//一天的秒数
    NSDate *current = begainDate;
    while (YES) {
        if ([current compare:endDate] > 0) {
            break;
        }
        else
        {
            [arrayDays addObject:current];
            current = [[NSDate alloc] initWithTimeInterval:oneDay sinceDate:current];//加一天
        }
    }
    return arrayDays;
}

//把时间2014-07-16 09:09:09 转换为 YYMMDDHHmmss 140716090909
+ (NSString *)getDateStrFromDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYMMddHHmmss";
    return [formatter stringFromDate:date];
}

//把时间2014-07-16 09:09:09 转换为 YY-MM-DDHH:mm 140716090909
+ (NSString *)getStringFromDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    return [formatter stringFromDate:date];
}

+ (NSString *)getDateStrFromDate:(NSDate *)date time:(NSDate *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYMMdd";
    NSString *dateStr = [formatter stringFromDate:date];
    formatter.dateFormat = @"HHmmss";
    NSString *timeStr = [formatter stringFromDate:time];
    return [NSString stringWithFormat:@"%@%@",dateStr,timeStr];
}

//把时间字符串YYMMDDHHmmss 140716090909 转换为时间 2014-07-16 09:09:09
+ (NSDate *)getDateTimeFromDateStr:(NSString *)dateStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    return [formatter dateFromString:dateStr];
}

//把字符串转化为LongLong类型的
+ (long long)getLonglongByTimeStr:(NSString *)timer
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    
    NSDate *date = [formatter dateFromString:timer];
    
    return [self getDateTimeTOMilliSeconds:date];
}

//把时间转换为8月15日 18:30
+ (NSString *)getTimeStr:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM月dd日 HH:mm";
    return [formatter stringFromDate:date];
}

//10-10 ->10月10号
+ (NSString *)getChinaMonthForData:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM月dd日";
    return [formatter stringFromDate:date];
}

//2014-10-10 10-10 ->2014-10-10 10:10
+ (NSString *)getDateForData:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm";
    return [formatter stringFromDate:date];
}

@end
