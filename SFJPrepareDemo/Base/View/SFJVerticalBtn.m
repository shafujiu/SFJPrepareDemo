//
//  SFJVerticalBtn.m
//  SFJHappyCreateProduct
//
//  Created by 沙缚柩 on 2017/4/27.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJVerticalBtn.h"

@implementation SFJVerticalBtn

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
    
    CGFloat btnW = self.frame.size.width;
    CGFloat btnH = self.frame.size.height;
    
    CGFloat imgH = self.imageView.frame.size.height;
    CGFloat imgW = self.imageView.frame.size.width;
    
    CGFloat titleH = self.titleLabel.frame.size.height;
    CGFloat titleW =  btnW; //self.titleLabel.frame.size.width;
    
    CGFloat margin = 10;
    
    CGFloat imgY = (btnH - (imgH + titleH + margin)) * .5;
    CGFloat imgX = (btnW - imgW) * .5;
    
    self.imageView.frame = CGRectMake(imgX, imgY, imgW, imgH);
    
    CGFloat titleY = CGRectGetMaxY(self.imageView.frame) + margin;
    CGFloat titleX = (btnW - titleW) * .5;
    
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}

@end
