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
    
    _textView.text = [NSString stringWithFormat:@"格式化当前时间： %@",dateStr];
    
}

@end
