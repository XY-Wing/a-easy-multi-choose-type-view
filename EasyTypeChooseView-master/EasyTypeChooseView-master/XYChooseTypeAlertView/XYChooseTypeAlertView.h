//
//  XYChooseTypeAlertView.h
//  万家
//
//  Created by Xue Yang on 2017/2/15.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYChooseTypeAlertView;
@protocol XYChooseTypeAlertViewDelegate <NSObject>
- (void)chooseTypeAlertView:(XYChooseTypeAlertView *)alertView didSelectedIndex:(NSInteger)index;
@optional
- (void)chooseTypeAlertViewWillDisappear:(XYChooseTypeAlertView *)alertView;
@end
//弹出类型选择框
@interface XYChooseTypeAlertView : UIView
- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArr;
- (void)showChooseTypeView;
- (void)hideChooseTypeView;
@property(nonatomic,assign)id<XYChooseTypeAlertViewDelegate>delegate;
@end
