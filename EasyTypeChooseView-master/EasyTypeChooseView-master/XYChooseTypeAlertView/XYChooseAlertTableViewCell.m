//
//  XYChooseAlertTableViewCell.m
//  万家
//
//  Created by Xue Yang on 2017/2/15.
//  Copyright © 2017年 Xue Yang. All rights reserved.
//

#import "XYChooseAlertTableViewCell.h"
@interface XYChooseAlertTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *typeLab;
@end
@implementation XYChooseAlertTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setTypeName:(NSString *)typeName
{
    _typeName = typeName;
    
    _typeLab.text = typeName;
}

@end
