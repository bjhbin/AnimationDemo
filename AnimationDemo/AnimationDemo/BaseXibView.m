//
//  BaseXibView.m
//  JRJNews
//
//  Created by Mr.Yang on 14-4-8.
//  Copyright (c) 2014年 Mr.Yang. All rights reserved.
//

#import "BaseXibView.h"

@implementation BaseXibView

+ (id)newXibView
{
    //return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
    
    return  [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil] lastObject];
}


@end
