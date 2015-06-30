//
//  NSString+Size.m
//  AnimationDemo
//
//  Created by JY on 15/6/30.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)size
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    
    return [self boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:dic
                              context:nil
            ].size;
}
@end
