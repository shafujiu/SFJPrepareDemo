//
//  UIView+SFJExtension.h
//  AccountBook
//
//  Created by ZhaoWei on 16/11/8.
//  Copyright © 2016年 ZhaoWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SFJExtension)


@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
//@property (nonatomic, assign) CGFloat bottom;

//- (CGFloat)x;
//- (void)setX:(CGFloat)x;
/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/

@end
