//
//  UIView+SFJExtension.m
//  SFJPrepareDemo
//
//  Created by 沙缚柩 on 2017/4/13.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "UIView+SFJExtension.h"

@implementation UIView (SFJExtension)
// x y
- (void)setSfj_x:(CGFloat)sfj_x{
    CGRect frame = self.frame;
    frame.origin.x = sfj_x;
    self.frame = frame;
}

- (CGFloat)sfj_x{
    return self.frame.origin.x;
}

- (void)setSfj_y:(CGFloat)sfj_y{
    CGRect frame = self.frame;
    frame.origin.y = sfj_y;
    self.frame = frame;
}

- (CGFloat)sfj_y{
    return self.frame.origin.y;
}

// width height
- (void)setSfj_width:(CGFloat)sfj_width{
    CGRect frame = self.frame;
    frame.size.width = sfj_width;
    self.frame = frame;
}

- (CGFloat)sfj_width{
    return self.frame.size.width;
}

- (void)setSfj_height:(CGFloat)sfj_height{
    CGRect frame = self.frame;
    frame.size.height = sfj_height;
    self.frame = frame;
}

- (CGFloat)sfj_height{
    return self.frame.size.height;
}

// centerX centerY
- (void)setSfj_centerX:(CGFloat)sfj_centerX{
    CGPoint center = self.center;
    center.x = sfj_centerX;
    self.center = center;
}

- (CGFloat)sfj_centerX{
    return self.center.x;
}

- (void)setSfj_centerY:(CGFloat)sfj_centerY{
    CGPoint center = self.center;
    center.y = sfj_centerY;
    self.center = center;
}

- (CGFloat)sfj_centerY{
    return self.center.y;
}




@end
