//
//  OtherViewController.m
//  AnimationDemo
//
//  Created by JY on 15/6/25.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "OtherViewController.h"
#import "OtherView.h"

@interface OtherViewController ()
@property (nonatomic,strong) OtherView *otherView;
@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.otherView];
    
}

- (OtherView *)otherView
{
    if (!_otherView) {
        _otherView = [[OtherView alloc] initWithFrame:CGRectMake(50, 150, 40, 40)];
        _otherView.backgroundColor = [UIColor blueColor];
    }
    return _otherView;
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
