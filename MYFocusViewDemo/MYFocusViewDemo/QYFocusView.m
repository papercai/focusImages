//
//  QYFocusView.m
//  MYFocusViewDemo
//
//  Created by qingyun on 14-10-24.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYFocusView.h"

@implementation QYFocusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame Images:(NSArray *)images
{
    self = [super initWithFrame:frame];
    if (self) {
        //组合图片
        NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithCapacity:self.images.count+2];
        [mutableArray addObject:images.lastObject];
        [mutableArray addObjectsFromArray:images];
        [mutableArray addObject:images[0]];
        self.images = mutableArray;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    scrollView.contentSize = CGSizeMake(self.images.count*self.bounds.size.width, self.bounds.size.height);
    self.scrollView = scrollView;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    
    for (int i = 0; i<self.images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:self.images[i]];
        imageView.frame =CGRectOffset(self.scrollView.frame, i*scrollView.frame.size.width, 0);
        [self.scrollView addSubview:imageView];
    }
    self.pageControls = [[UIPageControl alloc]initWithFrame:CGRectMake(100, 200, 120, 20)];
    self.pageControls.numberOfPages = 4;
    self.pageControls.currentPage = 0;
    self.pageControls.currentPageIndicatorTintColor = [UIColor greenColor];
    self.pageControls.backgroundColor = [UIColor grayColor];
    self.pageControls.userInteractionEnabled = YES;
        [self addSubview:self.scrollView];
    [self addSubview:self.pageControls];

    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, 0)];
}

- (void)startTimer
{
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
    }
}

- (void)timerFire:(NSTimer *)timer
{
    //设置scrollview偏移
    CGPoint point =CGPointZero;
    if (self.scrollView.contentOffset.x >= (self.images.count - 1)*self.frame.size.width) {
        point = CGPointMake(self.frame.size.width, 0);
        [self.scrollView setContentOffset:point];
    }
    point = CGPointMake(self.scrollView.contentOffset.x+self.frame.size.width, 0);
    
    [UIView animateWithDuration:.5f animations:^
     {
         [self.scrollView setContentOffset:point animated:YES];
     }];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //停止拖拽
    [self startTimer];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrollView.contentOffset.x < 0) {
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width * (self.images.count - 2), 0)];
        
        self.is1 = YES;
    }else
    {
        self.is1 = NO;
    }

    if (self.scrollView.contentOffset.x >=(self.images.count - 1) * scrollView.frame.size.width) {
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];
       
        self.is2 = YES;
    }else
    {
        self.is2 = NO;
    }
    
    if (self.is2 == YES) {
        self.pageControls.currentPage = 0;
    }else if (self.is1 == YES)
    {
        self.pageControls.currentPage = 3;
    }else
    {
        self.pageControls.currentPage = floor(self.scrollView.contentOffset.x/320
                                              )-1 ;    }
//    int x = (int)self.scrollView.contentOffset.x/320;
//    if (x==4) {
//        [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(changeValue:) userInfo:nil repeats:NO];
//        //self.pageControls.currentPage = 0;
//        
//    }else if(x==0)
//    {
//        self.pageControls.currentPage = 3;
//    }else
//    {
//        self.pageControls.currentPage = (int)self.scrollView.contentOffset.x/320-1;
//    }
//   
//}
//
//- (void)changeValue:(NSTimer *)timer
//{
//    self.pageControls.currentPage = 0;
//}
}
@end
