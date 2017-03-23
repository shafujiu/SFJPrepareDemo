//
//  UITabBarItem+SFJExtension.m
//  FarmIrrigationAssistant
//
//  Created by 沙缚柩 on 2017/3/22.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "UITabBarItem+SFJExtension.h"

@implementation UITabBarItem (SFJExtension)

+ (instancetype)tabBarItemWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selImgName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *selImg = [UIImage imageNamed:selImgName];
    // 使用原始图片
    selImg = [selImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[self alloc] initWithTitle:title image:image selectedImage:selImg];
    return item;
}

@end
