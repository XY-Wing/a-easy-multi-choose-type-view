# a-easy-multi-choose-type-view
- 喜欢的话就赏个小星星吧😊
- 使用方式
--- 
    NSArray *arr = @[@"上班打卡",@"下班打卡",@"白班打卡",@"晚班打卡"];
    //1.初始化
    XYChooseTypeAlertView *alertV = [[XYChooseTypeAlertView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) withTitleArray:arr];
    //2.设置代理
    alertV.delegate = self;
    //3.显示
    [alertV showChooseTypeView];
---
<br>
--- 
>- (void)chooseTypeAlertView:(XYChooseTypeAlertView *)alertView didSelectedIndex:(NSInteger)index
{
    //选择后调用
    NSLog(@"index = %zd",index);
}
<br>
>-  (void)chooseTypeAlertViewWillDisappear:(XYChooseTypeAlertView *)alertView
{
    NSLog(@"消失调用");
}
---

![image](https://github.com/XY-Wing/a-easy-multi-choose-type-view/blob/master/EasyTypeChooseView-master/GIF/%E7%B1%BB%E5%9E%8B%E9%80%89%E6%8B%A9%E6%A1%86.gif)

