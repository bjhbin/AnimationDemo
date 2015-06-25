//
//  SlideViewController.m
//  AnimationDemo
//
//  Created by JY on 15/6/25.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "SlideViewController.h"
#import "SlideView.h"
@interface SlideViewController ()

@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    SlideView *slideView = [[SlideView alloc] initWithFrame:CGRectMake(screenWidth/2-100/2, screenHeight/2-50/2, 100, 50)];
    slideView.backgroundColor = [UIColor grayColor];
    
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    
    for (int i = 1; i<= 3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        [imageArray addObject:image];
    }
    
    [slideView showImages:imageArray];
    
    [self.view addSubview:slideView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
