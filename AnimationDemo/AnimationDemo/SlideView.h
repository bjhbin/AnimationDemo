//
//  SlideView.h
//  AnimationDemo
//
//  Created by JY on 15/6/25.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideView : UIView

@property (nonatomic,strong) NSArray *imageArray;

- (void)showImages:(NSArray *)imageArray;
@end
