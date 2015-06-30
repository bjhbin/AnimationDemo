//
//  ChatWithOtherCell.h
//  AnimationDemo
//
//  Created by JY on 15/6/30.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "Person.h"

//  他人的会话内容
@interface ChatWithOtherCell : BaseTableViewCell

+ (CGFloat)heightWithPerson:(Person *)person;

- (void)configWithPerson:(Person *)person;
@end
