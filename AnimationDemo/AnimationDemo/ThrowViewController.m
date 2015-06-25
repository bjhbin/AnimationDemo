//
//  ThrowViewController.m
//  AnimationDemo
//
//  Created by JY on 15/6/25.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "ThrowViewController.h"
#import "ThrowLineTool.h"

@interface ThrowViewController ()
@property (nonatomic,strong) UIImageView *centerImageView;
@end

@implementation ThrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.centerImageView= [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50/2, self.view.frame.size.height/2-50, 50, 50)];
    self.centerImageView.image = [UIImage imageNamed:@"3.jpg"];
    
    [self.view addSubview:self.centerImageView];
 
    
    //[self performSelector:@selector(throwAction) withObject:nil afterDelay:1.5];
    

    [NSTimer scheduledTimerWithTimeInterval:5.01 target:self selector:@selector(throwAction) userInfo:nil repeats:YES];

    

}


- (void)showAnimation
{
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    shake.fromValue = [NSNumber numberWithFloat:-M_PI/32];
    
    shake.toValue = [NSNumber numberWithFloat:+M_PI/32];
    
    shake.duration = 0.1;
    
    shake.autoreverses = YES; //是否重复
    
    shake.repeatCount = 1;
    
    [self.centerImageView.layer addAnimation:shake forKey:@"shakeAnimation"];
    
//    self.centerImageView.alpha = 1.0;
//    
//    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction animations:^{
//        //self.centerImageView.alpha = 0.0; //透明度变0则消失
//    } completion:nil];
}

- (void)throwAction
{
   
        ThrowLineTool *throwLineTool = [ThrowLineTool sharedTool];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(-20, 330, 20, 20)];
        imageView.image = [UIImage imageNamed:@"2.jpg"];
        
        [self.view addSubview:imageView];
        
        [throwLineTool throwObject:imageView from:CGPointMake(-20, 120) to:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2) height:20 duration:5];
    
       [NSTimer scheduledTimerWithTimeInterval:5.02 target:self selector:@selector(showAnimation) userInfo:nil repeats:YES];
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
