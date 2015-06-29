//
//  ViewController.m
//  AnimationDemo
//
//  Created by JY on 15/6/25.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "ViewController.h"
#import "SlideViewController.h"
#import "OtherViewController.h"
#import "ThrowViewController.h"
#import "CountMoneyViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    [self.dataList addObject:@"滑动动画"];
    [self.dataList addObject:@"其他动画"];
    [self.dataList addObject:@"抛物线动画"];
    [self.dataList addObject:@"标签切换"];
    [self.dataList addObject:@"数钱动画"];
    [self.view addSubview:self.tableView];
    
    
}

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.dataList[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        SlideViewController *svc = [[SlideViewController alloc] init];
        [self.navigationController pushViewController:svc animated:YES];
    } else if (indexPath.row == 1) {
        
        OtherViewController *ovc = [[OtherViewController alloc] init];
        [self.navigationController pushViewController:ovc animated:YES];
    } else if (indexPath.row == 2) {
        ThrowViewController *tvc = [[ThrowViewController alloc] init];
        [self.navigationController pushViewController:tvc animated:YES];
    } else if (indexPath.row == 4) {
        CountMoneyViewController *cmv = [[CountMoneyViewController alloc] init];
        [self.navigationController pushViewController:cmv animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
