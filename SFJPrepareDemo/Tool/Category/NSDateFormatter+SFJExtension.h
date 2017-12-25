//
//  NSDateFormatter+SFJExtension.h
//  SFJProject
//
//  Created by 沙缚柩 on 2017/3/27.
//  Copyright © 2017年 ZhaoWei. All rights reserved.
//
/**
 1. NSDate 转 NSString
 2. NSString 转 NSDate
 3. NSTimeInterval 转 NSString
 4. NSString 转 NSTimeInterval
 5. dateStr to DateStr
*/

#import <Foundation/Foundation.h>

@interface NSDateFormatter (SFJExtension)

+ (instancetype)shareDateFormatter;
// 1. NSDate 转 NSString
+ (NSString *)sfj_dateToDateStr:(NSDate *)date formatterStr:(NSString *)formatter;
// 2. NSString 转 NSDate
+ (NSDate *)sfj_dateStrToDate:(NSString *)string formatterStr:(NSString *)formatter;
// 3. NSTimeInterval 转 NSString
+ (NSString *)sfj_timeIntervalToDateStr:(NSTimeInterval)interval formatterStr:(NSString *)formatter;
// 4. NSString 转 NSTimeInterval
+ (NSTimeInterval)sfj_dateStrToTimeInterval:(NSString *)string formatterStr:(NSString *)formatter;
// 5. dateStr to DateStr
+ (NSString *)sfj_dateStrToDateStr:(NSString *)dateStr fromFormatterStr:(NSString *)fFormatter toFormatterStr:(NSString *)toformatter;


/**
 *  计算上次日期距离现在多久
 *
 *  @param lastTime    上次日期(需要和格式对应)
 *  @param format1     上次日期格式
 *  @param currentTime 最近日期(需要和格式对应)
 *  @param format2     最近日期格式
 *
 *  @return xx分钟前、xx小时前、xx天前
 */
+ (NSString *)sfj_timeIntervalFromLastTime:(NSString *)lastTime
                        lastTimeFormat:(NSString *)format1
                         ToCurrentTime:(NSString *)currentTime
                     currentTimeFormat:(NSString *)format2;

/**
 计算上次的时间距离现在多久

 @param lastTime 上一次的date
 @param currentTime 这一次的date
 @return xx分钟前、xx小时前、xx天前
 */
+ (NSString *)sfj_timeIntervalFromLastDate:(NSDate *)lastTime
                             ToCurrentDate:(NSDate *)currentTime;

@end
