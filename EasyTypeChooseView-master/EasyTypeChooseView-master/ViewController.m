//
//  ViewController.m
//  EasyTypeChooseView-master
//
//  Created by Xue Yang on 2017/4/27.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "ViewController.h"
#import "XYChooseTypeAlertView.h"
@interface ViewController ()<XYChooseTypeAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}
#pragma mark - 代理方法
- (void)chooseTypeAlertView:(XYChooseTypeAlertView *)alertView didSelectedIndex:(NSInteger)index
{
    //选择后调用
    NSLog(@"index = %zd",index);
}
- (void)chooseTypeAlertViewWillDisappear:(XYChooseTypeAlertView *)alertView
{
    NSLog(@"消失调用");
}
- (IBAction)btnClicked {
    NSArray *arr = @[@"上班打卡",@"下班打卡",@"白班打卡",@"晚班打卡"];
    //1.初始化
    XYChooseTypeAlertView *alertV = [[XYChooseTypeAlertView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) withTitleArray:arr];
    //2.设置代理
    alertV.delegate = self;
    //3.显示
    [alertV showChooseTypeView];
}
@end
