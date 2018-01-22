//
//  SFJDateFormatterTestController.m
//  SFJPrepareDemo
//
//  Created by 沙缚柩 on 2017/4/14.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJDateFormatterTestController.h"
#import "NSDateFormatter+SFJExtension.h"

@interface SFJDateFormatterTestController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation SFJDateFormatterTestController

- (IBAction)formatterBtn:(id)sender {
    NSString *dateStr = [NSDateFormatter sfj_dateToDateStr:[NSDate date] formatterStr:@"yyyy-MM-dd HH:mm:ss"];
    
    
    
//    _textView.text = [NSString stringWithFormat:@"格式化当前时间： %@",dateStr];
    
    NSString *timeIntervalStr = [NSDateFormatter sfj_timeIntervalFromLastTime:@"2017-12-22 12:12:12" lastTimeFormat:@"yyyy-MM-dd HH:mm:ss" ToCurrentTime:@"2017-12-25 10:12:12" currentTimeFormat:@"yyyy-MM-dd HH:mm:ss"];
    _textView.text = timeIntervalStr;
    
}

@end
