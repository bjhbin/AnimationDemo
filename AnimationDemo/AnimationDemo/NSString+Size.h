//
//  NSString+Size.h
//  AnimationDemo
//
//  Created by JY on 15/6/30.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)size;
@end
