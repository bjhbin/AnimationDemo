//
//  CountMoneyViewController.m
//  AnimationDemo
//
//  Created by JY on 15/6/29.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "CountMoneyViewController.h"
#import "MoneyImageView.h"

@interface CountMoneyViewController ()

@end

@implementation CountMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 568-180-64-20, 300, 180)];
    backImageView.image = [UIImage imageNamed:@"one.jpg"];
    
    
    MoneyImageView *moneyImageView = [[MoneyImageView alloc] initWithFrame:backImageView.frame];
    
    moneyImageView.image = [UIImage imageNamed:@"one.jpg"];
    moneyImageView.userInteractionEnabled = YES;
    
    [self.view addSubview:backImageView ];

    [self.view addSubview:moneyImageView];
   
    UIImageView *rotateImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    rotateImageView.image = [UIImage imageNamed:@"one.jpg"];
    [self.view addSubview:rotateImageView];
    
    moneyImageView.rotateImageView = rotateImageView;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
