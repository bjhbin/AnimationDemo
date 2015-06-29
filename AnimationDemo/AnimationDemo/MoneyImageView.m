//
//  MoneyImageView.m
//  AnimationDemo
//
//  Created by JY on 15/6/29.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "MoneyImageView.h"

@interface MoneyImageView  ()

@property (nonatomic,assign) CGFloat startPoint;
@property (nonatomic,assign) CGRect initFrame;
@end

@implementation MoneyImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.initFrame = frame;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    CGPoint point = [[touches anyObject] locationInView:self];
    self.startPoint = point.y;
//    self.transform = CGAffineTransformMakeScale(1,0.8);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    [super touchesMoved:touches withEvent:event];
    CGPoint point = [[touches anyObject] locationInView:self];
    
    CGFloat moveY = point.y - self.startPoint;
    CGPoint newcenter = CGPointMake(self.center.x , self.center.y + moveY);
    self.center=newcenter;
    
    CGFloat currentY = self.frame.origin.y;
    NSLog(@"currenty:%f",currentY);
    CGFloat initY = self.initFrame.origin.y;
    NSLog(@"initY:%f",initY);
    CGFloat distanceY = initY - currentY;
    NSLog(@"distanceY:%f",distanceY);
    
//    if (distanceY>=30) {
//        //向上移动30的距离
//        distanceY = 0;
//        [self currentViewAnimation];
//
//    
//    } else {
//        //self.center = originalcenter;
//
//    }
    
//    self.transform = CGAffineTransformInvert(CGAffineTransformIdentity);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    CGFloat currentY = self.frame.origin.y;
    CGFloat initY = self.initFrame.origin.y;
    
    CGFloat distanceY = initY - currentY;
    
    //小于三十的距离 松开 回到原始的位置
    if (distanceY<30) {
        [self originalPosition];
        
    }else {
        [self currentViewAnimation];
    }
    
}

- (void)currentViewAnimation
{
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = self.frame;
        rect.origin.y = -self.frame.size.height;
        self.frame = rect;
    } completion:^(BOOL finished) {
        
        self.frame = self.initFrame;
        
        [self rotateImageViewAnimation];
    }];
}

- (void)originalPosition
{
    [UIView animateWithDuration:0.1 animations:^{
        self.frame = self.initFrame;
    }];
}

- (void)rotateImageViewAnimation
{
    [UIView animateWithDuration:1 animations:^{
        
        CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotateAnimation.fromValue = @(0);
        rotateAnimation.toValue = @(2*M_PI);
        
        rotateAnimation.autoreverses = NO;
        rotateAnimation.repeatCount = 20;
        rotateAnimation.duration = 0.3;
        
        float x = random()%320;
        CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(x, -self.rotateImageView.frame.size.height)];
        positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(x, self.superview.frame.size.height)];
        
        positionAnimation.autoreverses = NO;
        positionAnimation.repeatCount = 1;
        
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.animations = @[rotateAnimation,positionAnimation];
        animationGroup.duration = 1.3;
        
        [self.rotateImageView.layer addAnimation:animationGroup forKey:@"animationGroup"];
        
    } completion:^(BOOL finished) {
        CGRect rect = self.rotateImageView.frame;
        
        rect.origin.y = - self.rotateImageView.frame.size.height;
        
        self.rotateImageView.frame = rect;
    }];
    
    
    
    
}


@end
