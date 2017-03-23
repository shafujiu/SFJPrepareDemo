//
//  SFJMainTabBarController.m
//  SFJPrepareDemo
//
//  Created by 沙缚柩 on 2017/3/22.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJMainTabBarController.h"
#import "UITabBarItem+SFJExtension.h"
#import "SFJBaseNavController.h"
#import "SFJFirstPageController.h"
#import "SFJSetViewController.h"

@interface SFJMainTabBarController ()

@end

@implementation SFJMainTabBarController

// 当第一次使用这个类的时候会调用一次
+ (void)initialize{
    
    [self p_initTabBarItem];
    [self p_setupTabBar];
}

+ (void)p_setupTabBar{
    
    UIImage *clearColorImg = [UIImage new];
    [[UITabBar appearance] setBackgroundImage:clearColorImg];
    [[UITabBar appearance] setShadowImage:clearColorImg];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
}

+ (void)p_initTabBarItem{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selAttrs = [NSMutableDictionary dictionary];
    selAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selAttrs forState:UIControlStateSelected];
}

// 通过该方法创建子控制器
- (void)p_setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)imgName selectedImage:(NSString *)selImgName{
    
//    vc.navigationItem.title = @"设置";
    
    UITabBarItem *item = [UITabBarItem tabBarItemWithTitle:title imageName:imgName selectedImageName:selImgName];
    vc.tabBarItem = item;
    
    SFJBaseNavController *nav = [[SFJBaseNavController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

// 也可以通过sb设置
// 通过代码设置
- (void)p_setupControllers{
    
    UIViewController *firstvc = [[SFJFirstPageController alloc] init];
    [self p_setupChildVC:firstvc title:@"首页" image:@"tab_first_page_icon" selectedImage:@"tab_first_page_icon_h"];
    
    UIViewController *setVC = [[SFJSetViewController alloc] init];
    [self p_setupChildVC:setVC title:@"设置" image:@"tab_me" selectedImage:@"tab_me_h"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setupControllers];
}




@end
