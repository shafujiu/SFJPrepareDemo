//
//  SFJFirstPageController.m
//  SFJPrepareDemo
//
//  Created by 沙缚柩 on 2017/3/23.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJFirstPageController.h"
#import "UIView+SFJExtension.h"

@interface SFJFirstPageController ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@property (weak, nonatomic) IBOutlet UITextView *testTextView;
@end

@implementation SFJFirstPageController

- (instancetype)init{
    UIStoryboard *firstPageSB = [UIStoryboard storyboardWithName:@"SFJFirstPage" bundle:nil];
    SFJFirstPageController *firstvc = [firstPageSB instantiateViewControllerWithIdentifier:NSStringFromClass([SFJFirstPageController class])];
    return firstvc;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"测试UIView分类";
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self getViewFrameInfo:_testView];
    
}

- (void)getViewFrameInfo:(UIView *)view{
    _testTextView.text = [NSString stringWithFormat:@"点击屏幕 刷新信息 \nx = %f\n y = %f \n width = %f \n height = %f \n centerX = %f \n centerY = %f",view.sfj_x,view.sfj_y,view.sfj_width,view.sfj_height,view.sfj_centerX,view.sfj_centerY];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self getViewFrameInfo:_testView];
}

- (IBAction)setFrame:(id)sender {
    _testView.sfj_x = 10;
    _testView.sfj_y = 40;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
