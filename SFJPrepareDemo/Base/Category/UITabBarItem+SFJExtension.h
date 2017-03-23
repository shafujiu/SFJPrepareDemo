//
//  UITabBarItem+SFJExtension.h
//  FarmIrrigationAssistant
//
//  Created by 沙缚柩 on 2017/3/22.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (SFJExtension)

+ (instancetype)tabBarItemWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selImgName;

@end
