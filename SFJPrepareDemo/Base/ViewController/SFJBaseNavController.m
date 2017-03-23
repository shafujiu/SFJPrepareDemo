//
//  SFJBaseNavController.m
//  SFJPrepareDemo
//
//  Created by 沙缚柩 on 2017/3/22.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJBaseNavController.h"

@interface SFJBaseNavController ()

@end

@implementation SFJBaseNavController
+ (void)initialize{
    
    [self p_setupNargationBarItem];
    [self p_setupNavigationBar];
}

+ (void)p_setupNavigationBar{
    // 获取哪个类下面的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    // 设置导航栏的颜色
    [bar setBarTintColor:[UIColor purpleColor]];
    // 导航栏是否半透明
    [bar setTranslucent:NO];
    // 设置导航栏返回键的渲染颜色
    [bar setTintColor:[UIColor whiteColor]];
    
    bar.shadowImage = [UIImage new];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                  NSFontAttributeName : [UIFont systemFontOfSize:20]
                                  }];
    // 设置状态栏的颜色
    [bar setBarStyle:UIBarStyleBlack];
}

+ (void)p_setupNargationBarItem{
    // 设置系统的返回的title的偏移量
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - 拦截push，隐藏标签栏
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count != 0) { // 说明是非根控制器（导航控制器里面有）
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}



@end
