//
//  JYBaseTableViewCell.m
//  GuGuHelp
//
//  Created by JY on 15/6/5.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (BaseTableViewCell *)newCell
{
    BaseTableViewCell *cell = [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil] lastObject];
    
    return cell;
}

+ (NSString *)identifier
{
    return NSStringFromClass([self class]);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
