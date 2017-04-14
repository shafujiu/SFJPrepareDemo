//
//  NSDateFormatter+SFJExtension.m
//  SFJProject
//
//  Created by 沙缚柩 on 2017/3/27.
//  Copyright © 2017年 ZhaoWei. All rights reserved.
//

#import "NSDateFormatter+SFJExtension.h"

@implementation NSDateFormatter (SFJExtension)

static NSDateFormatter *instance_ = nil;

+ (instancetype)shareDateFormatter{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [[self alloc] init];
    });
    return instance_;
}

// 1. NSDate 转 NSString
+ (NSString *)sfj_dateToDateStr:(NSDate *)date formatterStr:(NSString *)formatter{
    NSDateFormatter *fomat = [self shareDateFormatter];
    fomat.dateFormat = formatter;
    return [fomat stringFromDate:date];
}
// 2. NSString 转 NSDate
+ (NSDate *)sfj_dateStrToDate:(NSString *)string formatterStr:(NSString *)formatter{
    NSDateFormatter *fomat = [self shareDateFormatter];
    fomat.dateFormat = formatter;
    return [fomat dateFromString:string];
}
// 3. NSTimeInterval 转 NSString
+ (NSString *)sfj_timeIntervalToDateStr:(NSTimeInterval)interval formatterStr:(NSString *)formatter{
    // 1. interval to NSDate
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:interval];
    
    // 2. formatter Date to NSString
    return [self sfj_dateToDateStr:date formatterStr:formatter];
}
// 4. NSString 转 NSTimeInterval
+ (NSTimeInterval)sfj_dateStrToTimeInterval:(NSString *)string formatterStr:(NSString *)formatter{
    // 1. NSString to NSDate
    NSDate *date = [self sfj_dateStrToDate:string formatterStr:formatter];
    // 2. NSDate to NSTimeInterval
    return [date timeIntervalSinceDate:date];
}
// 5. dateStr to DateStr
+ (NSString *)sfj_dateStrToDateStr:(NSString *)dateStr fromFormatterStr:(NSString *)fFormatter toFormatterStr:(NSString *)toFormatter{
    NSDate *date = [self sfj_dateStrToDate:dateStr formatterStr:fFormatter];
    return [self sfj_dateToDateStr:date formatterStr:toFormatter];
}

@end
