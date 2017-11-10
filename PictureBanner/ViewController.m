//
//  ViewController.m
//  PictureBanner
//
//  Created by super on 2017/11/10.
//  Copyright © 2017年 super. All rights reserved.
//

#import "ViewController.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
CGFloat kImgCount = 10;
CGFloat scrollY = 20;
CGFloat pageCtrlWidth = 200;

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageCtrl;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initScrollView];
    [self initPageControl];
    [self addTimer];
}

//创建UIScrollView
- (void)initScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, scrollY, kScreenWidth, kScreenHeight - scrollY)];
    self.scrollView.delegate = self;
    for (int i = 0; i<kImgCount; i++) {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, scrollY, kScreenWidth, kScreenHeight)];
        imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"huoying%d", i + 1]];
        [self.scrollView addSubview:imageview];
    }
    
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * kImgCount, kScreenHeight - 20);
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
}

//创建UIPageControl
- (void)initPageControl{
    self.pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake((kScreenWidth - pageCtrlWidth) / 2, kScreenHeight - scrollY, pageCtrlWidth, scrollY)];
    self.pageCtrl.numberOfPages = kImgCount;
    self.pageCtrl.pageIndicatorTintColor = [UIColor blueColor];
    self.pageCtrl.currentPageIndicatorTintColor = [UIColor yellowColor];
    [self.view insertSubview:self.pageCtrl aboveSubview:self.scrollView];
}

- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextPage{
    NSInteger page = self.pageCtrl.currentPage;
    page++;
    if (page == kImgCount) {
        page = 0;
    }
    CGPoint point = CGPointMake(kScreenWidth * page, 0);
    [self.scrollView setContentOffset:point animated:YES];
}

#pragma mark - UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x / kScreenWidth + 0.5;
    self.pageCtrl.currentPage = page;
}

//视图将要拖动的时候
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"begindragging");
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"enddragging");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addTimer];
    });
}

- (void)removeTimer{
    if (self.timer.valid) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

