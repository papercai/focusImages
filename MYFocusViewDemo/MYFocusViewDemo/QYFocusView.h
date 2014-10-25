//
//  QYFocusView.h
//  MYFocusViewDemo
//
//  Created by qingyun on 14-10-24.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYFocusView : UIView<UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame Images:(NSArray *)images;
- (void)startTimer;

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)NSArray *images;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)UIPageControl *pageControls;
@property (nonatomic,assign)BOOL is1;
@property (nonatomic,assign)BOOL is2;
@end
