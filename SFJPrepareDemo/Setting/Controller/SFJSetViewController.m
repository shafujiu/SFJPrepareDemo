//
//  SFJSetViewController.m
//  SFJPrepareDemo
//
//  Created by 沙缚柩 on 2017/3/23.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJSetViewController.h"

@interface SFJSetViewController ()

@end

@implementation SFJSetViewController

- (instancetype)init{
    UIStoryboard *setSB = [UIStoryboard storyboardWithName:@"SFJSet" bundle:nil];
    SFJSetViewController *setVC = [setSB instantiateViewControllerWithIdentifier:NSStringFromClass([SFJSetViewController class])];
    return setVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIStoryboard *setSB = [UIStoryboard storyboardWithName:@"SFJSet" bundle:nil];
    UIViewController *vc = [setSB instantiateViewControllerWithIdentifier:@"SFJLoginViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
