//
//  SlideView.m
//  AnimationDemo
//
//  Created by JY on 15/6/25.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "SlideView.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface SlideView ()
@property (nonatomic,strong) UIButton *btnLastImage;
@end

@implementation SlideView

- (void)showImages:(NSArray *)imageArray
{

    self.imageArray = imageArray;
    
    [self btnLastImage];

    
    for (UIImage *image in imageArray) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.height - 10)];
        imageView.image = image;
        
        UISwipeGestureRecognizer *swipeGestLeft =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
        swipeGestLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        
        UISwipeGestureRecognizer *swipeGestRight =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
        swipeGestRight.direction = UISwipeGestureRecognizerDirectionRight;
        
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:swipeGestLeft];
        [imageView addGestureRecognizer:swipeGestRight];
        
        
        [self addSubview:imageView];
    }
}

- (void)swipeAction:(UISwipeGestureRecognizer*)recognizer {
    
    // 底下是刪除手势的方法
    UIImageView *imageView = (UIImageView *)recognizer.view ;
    

    [UIView animateWithDuration:0.5 animations:^{
        
        if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
            imageView.transform = CGAffineTransformMakeTranslation(-kScreenWidth,imageView.frame.origin.y);
            
        } else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight){
            imageView.transform = CGAffineTransformMakeTranslation(kScreenWidth,imageView.frame.origin.y);
        }
        
        
        imageView.alpha = 0;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}

- (UIButton *)btnLastImage
{
    if (!_btnLastImage) {
        _btnLastImage = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnLastImage.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_btnLastImage addTarget:self action:@selector(btnLastImageAction) forControlEvents:UIControlEventTouchUpInside];
        _btnLastImage.frame = CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.height - 10);
        [_btnLastImage setTitle:@"没有啦,点击重来"  forState:UIControlStateNormal];
        [_btnLastImage setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btnLastImage.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_btnLastImage];
    }
    return _btnLastImage;
}


- (void)btnLastImageAction
{
    [self showImages:self.imageArray];
}

@end
