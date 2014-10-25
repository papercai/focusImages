//
//  QYViewController.m
//  MYFocusViewDemo
//
//  Created by qingyun on 14-10-24.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYFocusView.h"
@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	QYFocusView *view = [[QYFocusView alloc]initWithFrame:CGRectMake(0, 0, 320, 110) Images:@[[UIImage imageNamed:@"0.jpg"],[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"]]];
    [self.view addSubview:view];
    [view startTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
