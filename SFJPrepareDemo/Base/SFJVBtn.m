//
//  SFJVBtn.m
//  FarmIrrigationAssistant
//
//  Created by 沙缚柩 on 2017/2/17.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJVBtn.h"

@implementation SFJVBtn

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    
//    CGFloat imgW = CGRectGetWidth(self.imageView.frame);
//    CGFloat imgH = CGRectGetHeight(self.imageView.frame);
//    
//    
//    CGFloat titleW = CGRectGetWidth(self.titleLabel.frame);
//    CGFloat titleH = CGRectGetHeight(self.titleLabel.frame);
//    
//    CGFloat margin = 0;
//    
//    CGFloat btnW = imgW > titleW ? imgW : titleW;
//    CGFloat btnH = imgH + margin + titleH;
//    
//    CGFloat imgX = imgW > titleW ?  CGRectGetMinX(self.imageView.frame) : (titleW - imgW) * .5;
//    CGFloat imgY = 0;
//    
//    CGFloat btnX = CGRectGetMinX(self.frame);
//    CGFloat btnY = CGRectGetMinY(self.frame);
//
//    self.frame = CGRectMake(btnX, btnY, btnW, btnH);
//    self.imageView.frame = CGRectMake(imgX, imgY, imgW, imgH);
//    
//    CGFloat titleX = titleW > imgW ? 0 : (imgW - titleW) * .5;
//    CGFloat titleY = CGRectGetMaxY(self.imageView.frame) + margin;
//    
//    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
//
//    CGFloat w = self.imageView.image.size.width;
//    CGFloat h = self.imageView.image.size.height;
//    
//    CGFloat x = (CGRectGetWidth(self.frame) - w) /2;
//    CGFloat y = 0;
//    self.imageView.frame = CGRectMake(x, y, w, h);
//    
//    CGFloat margin = 5;
//    
//    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + margin, CGRectGetWidth(self.frame), CGRectGetHeight(self.titleLabel.frame));
    
    
    // Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.imageView.frame.size.height/2;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height + 0;
    newFrame.size.width = self.frame.size.width;
    
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
