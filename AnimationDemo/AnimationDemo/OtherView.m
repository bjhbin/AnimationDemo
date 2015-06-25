//
//  OtherView.m
//  AnimationDemo
//
//  Created by JY on 15/6/25.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "OtherView.h"

@implementation OtherView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=touches.anyObject;
    CGPoint location= [touch locationInView:self.superview];
    
    [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.center=location; //CGPointMake(160, 284);
    } completion:^(BOOL finished) {
        self.backgroundColor = [UIColor redColor];
    }];
}

@end
