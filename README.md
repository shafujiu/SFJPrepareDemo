# SFJPrepareDemo
三级控制器重复性工作的总结

## 基础框架搭建
> 如今现在的项目也基本上都是使用三级控制器搭建框架，所以每次开始一个项目的时候
都会有一些简单，但是却重复性的工作需要做。该demo就是对这些重复性代码的整理。

> 主要办法，就是创建标签控制器，导航控制器，试图控制器的基类。然后在基类的
initlize方法里面进行设置，导航控制器设置

```Objective-c
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
```

> 拦截导航控制器的push方法，实现，push到下一个控制器的时候隐藏tabBar

```Objective-c
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count != 0) { // 说明是非根控制器（导航控制器里面有）
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
```

> 标签控制器的基本设置
```Objective-c
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
```
> 封装添加子控制器的方法

```Objective-c
// 通过该方法创建子控制器
- (void)p_setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)imgName selectedImage:(NSString *)selImgName{
    
//    vc.navigationItem.title = @"设置"; // 导航栏的标题 通过其跟控制器设置
    
    UITabBarItem *item = [UITabBarItem tabBarItemWithTitle:title imageName:imgName selectedImageName:selImgName];
    vc.tabBarItem = item;
    
    SFJBaseNavController *nav = [[SFJBaseNavController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
```

> 最后当你需要创建三级控制器的框架的时候，可以直接参考该demo，重复使用base基类，通过上面的方法对基础标签项，背景等做设置
。最后只需要使用封装好的方法，添加你的子控制器就行了。

## Tool工具扩展
### UIView+SFJExtension
> 方便修改和设置中心点、frame
```Objective-c
@property (nonatomic, assign) CGFloat sfj_x;
@property (nonatomic, assign) CGFloat sfj_y;

@property (nonatomic, assign) CGFloat sfj_width;
@property (nonatomic, assign) CGFloat sfj_height;

@property (nonatomic, assign) CGFloat sfj_centerX;
@property (nonatomic, assign) CGFloat sfj_centerY;
```

