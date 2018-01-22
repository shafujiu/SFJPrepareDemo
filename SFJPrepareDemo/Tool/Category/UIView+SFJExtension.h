//
//  UIView+SFJExtension.h
//  SFJPrepareDemo
//
//  Created by 沙缚柩 on 2017/4/13.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SFJExtension)

@property (nonatomic, assign) CGFloat sfj_x;
@property (nonatomic, assign) CGFloat sfj_y;

@property (nonatomic, assign) CGFloat sfj_width;
@property (nonatomic, assign) CGFloat sfj_height;

@property (nonatomic, assign) CGFloat sfj_centerX;
@property (nonatomic, assign) CGFloat sfj_centerY;

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;

@end
