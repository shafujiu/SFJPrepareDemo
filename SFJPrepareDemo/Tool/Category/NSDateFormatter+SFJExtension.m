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
                     currentTimeFormat:(NSString *)format2{
    //上次时间
    NSDate *lastDate = [self sfj_dateStrToDate:lastTime formatterStr:format1];
    //当前时间
    NSDate *currentDate = [self sfj_dateStrToDate:currentTime formatterStr:format2];
    return [self p_timeIntervalFromLastDate:lastDate ToCurrentTime:currentDate];
}

+ (NSString *)sfj_timeIntervalFromLastDate:(NSDate *)lastTime
                             ToCurrentDate:(NSDate *)currentTime{
    return [self p_timeIntervalFromLastDate:lastTime ToCurrentTime:currentTime];
}

+ (NSString *)p_timeIntervalFromLastDate:(NSDate *)lastTime ToCurrentTime:(NSDate *)currentTime{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    //上次时间
    NSDate *lastDate = [lastTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:lastTime]];
    //当前时间
    NSDate *currentDate = [currentTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:currentTime]];
    //时间间隔
    NSInteger intevalTime = [currentDate timeIntervalSinceReferenceDate] - [lastDate timeIntervalSinceReferenceDate];
    
    //秒、分、小时、天、月、年
    NSInteger minutes = intevalTime / 60;
    NSInteger hours = intevalTime / 60 / 60;
    NSInteger day = intevalTime / 60 / 60 / 24;
    NSInteger month = intevalTime / 60 / 60 / 24 / 30;
    NSInteger yers = intevalTime / 60 / 60 / 24 / 365;
    
    if (minutes <= 10) {
        return  @"刚刚";
    }else if (minutes < 60){
        return [NSString stringWithFormat: @"%ld分钟前",(long)minutes];
    }else if (hours < 24){
        return [NSString stringWithFormat: @"%ld小时前",(long)hours];
    }else if (day < 7){
        return [NSString stringWithFormat: @"%ld天前",(long)day];
    }else if (month < 12){
        NSString * time = [self sfj_dateToDateStr:lastDate formatterStr:@"M月d日"];
        return time;
    }else if (yers >= 1){
        NSString * time = [self sfj_dateToDateStr:lastDate formatterStr:@"yyyy年M月d日"];
        return time;
    }
    return @"";
}

@end
