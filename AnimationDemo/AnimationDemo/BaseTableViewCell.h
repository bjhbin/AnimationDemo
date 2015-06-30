//
//  JYBaseTableViewCell.h
//  GuGuHelp
//
//  Created by JY on 15/6/5.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

+ (BaseTableViewCell *)newCell;
+ (NSString *)identifier;

@end
