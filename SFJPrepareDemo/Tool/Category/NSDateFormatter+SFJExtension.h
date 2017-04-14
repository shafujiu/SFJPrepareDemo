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

@end
