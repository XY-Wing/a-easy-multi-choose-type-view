//
//  XYChooseTypeAlertView.m
//  万家
//
//  Created by Xue Yang on 2017/2/15.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "XYChooseTypeAlertView.h"
#import "XYChooseAlertTableViewCell.h"
@interface XYChooseTypeAlertView()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)UITableView *tableView;
@end
static const CGFloat cellH = 44;
static NSString *const XYChooseAlertTableViewCellID = @"XYChooseAlertTableViewCell";
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@implementation XYChooseTypeAlertView
#pragma mark --- 懒加载

- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = [NSArray array];
    }
    return _titleArr;
}

#pragma mark --- 建表
- (UITableView *)tableView
{
    if (!_tableView)
    {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        /**
         *开发者可自定义cell
         */
        [_tableView registerNib:[UINib nibWithNibName:@"XYChooseAlertTableViewCell" bundle:nil] forCellReuseIdentifier:XYChooseAlertTableViewCellID];
        
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.layer.masksToBounds = YES;
        _tableView.layer.cornerRadius = 5;
        
        CGFloat tbCenterX = screenW * 0.5;
        CGFloat tbCenterY = screenH * 0.5;
        CGFloat tbW = screenW - 40;
        CGFloat tbH = _titleArr.count * cellH;
        if (tbH > screenH *0.7){
            _tableView.scrollEnabled = YES;
            tbH = screenH*0.7;
        }
        else
        {
            _tableView.scrollEnabled = NO;
        }
        
        _tableView.center = CGPointMake(0, 0);
        _tableView.bounds = CGRectMake(0, 0, tbW, tbH);
        
        [UIView animateWithDuration:0.3 animations:^{
//            _tableView.transform = CGAffineTransformMakeScale(1.05, 1.05);
            _tableView.center = CGPointMake(tbCenterX + 10, tbCenterY + 10);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.15 animations:^{
                _tableView.center = CGPointMake(tbCenterX , tbCenterY );
            }];
        }];
        
    }
    return _tableView;
}
- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArr
{
    if (self = [super initWithFrame:frame])
    {
        self.titleArr = titleArr;
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
       
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseViewClicked:)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        //初始化UI
         [self setupUIWithFrame:frame];
    }
    return self;
}

#pragma mark --- UIGestureRecognizerDelegate 解决冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([touch.view isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]){
        
        return NO;
        
    }
    
    return YES;
    
}

#pragma mark --- 手势点击
- (void)chooseViewClicked:(UITapGestureRecognizer *)tap
{
    
    if ([self.delegate respondsToSelector:@selector(chooseTypeAlertViewWillDisappear:)]) {
        [self.delegate chooseTypeAlertViewWillDisappear:self];
    }
    [self hideChooseTypeView];
   
}
- (void)layoutSubviews
{
    [super layoutSubviews];

}
#pragma mark --- 显示
- (void)showChooseTypeView
{
    self.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    }];
}
#pragma mark --- 隐藏
- (void)hideChooseTypeView
{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        _tableView.center = CGPointMake(screenW, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark --- 初始化UI
- (void)setupUIWithFrame:(CGRect)frame
{
    [self addSubview:self.tableView];
}

#pragma mark --- UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellH;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYChooseAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:XYChooseAlertTableViewCellID forIndexPath:indexPath];
    cell.typeName = _titleArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(chooseTypeAlertView:didSelectedIndex:)])
    {
        [self.delegate chooseTypeAlertView:self didSelectedIndex:indexPath.row];
    }
    
    [self hideChooseTypeView];
}
@end
