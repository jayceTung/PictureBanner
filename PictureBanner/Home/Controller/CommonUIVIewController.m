//
//  CommonUIVIewController.m
//  PictureBanner
//
//  Created by super on 2018/4/17.
//  Copyright © 2018年 super. All rights reserved.
//

#import "CommonUIVIewController.h"
#import "BaseViewController.h"

@interface CommonUIVIewController ()

@end

@implementation CommonUIVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button.frame = CGRectMake(200, 100, 90, 35);
//    [button setTitle:@"enter" forState:UIControlStateNormal];
//    [button setTitle:@"cancel" forState:UIControlStateHighlighted];
//    [button setBackgroundColor:UIColor.greenColor];
//    self.view.backgroundColor = UIColor.whiteColor;
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(getAlter) forControlEvents:UIControlEventTouchUpInside];

    
    CGRect rect = [[UIApplication sharedApplication] statusBarFrame];
    
    float width = [[UIScreen mainScreen] bounds].size.width;
    float height = [[UIScreen mainScreen] bounds].size.height;
    NSLog(@"width = %f height = %f \n status bar w = %f h = %f", width, height, rect.size.width, rect.size.height);
    
    //导航栏的大小
    CGRect rectNav = self.navigationController.navigationBar.frame;
    NSLog(@"rectNav w = %f h = %f", rectNav.size.width, rectNav.size.height);
    UIView *view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(10, rect.size.height + 10, width - 20, height - rect.size.height - 20);
    NSLog(@"frame x = %f y = %f w = %f h = %f", view1.frame.origin.x, view1.frame.origin.y, view1.frame.size.width, view1.frame.size.height);
    //bounds是边框大小，它的x y值永远都为0
    NSLog(@"bounds x = %f y = %f w = %f h = %f", view1.bounds.origin.x, view1.bounds.origin.y, view1.bounds.size.width, view1.bounds.size.height);
    NSLog(@"center x = %f y = %f", view1.center.x, view1.center.y);
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    //父视图
    UIView *superView = view1.superview;
    superView.backgroundColor = [UIColor whiteColor];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    view2.frame = CGRectMake(10, 150, 50, 50);
    view2.tag = 2;
    [view1 addSubview:view2];
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor purpleColor];
    view3.frame = CGRectMake(20, 130, 30, 100);
    view3.tag = 3;
    [view1 addSubview:view3];
    
    NSArray *array = superView.subviews;
    for (UIView *view in array) {
        if (view.tag == 3) {
            view.backgroundColor = [UIColor purpleColor];
        }
    }
    
    //自适应
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor purpleColor];
    centerView.frame = CGRectMake(width/2 - 25, height/2 - 25 - rect.size.height, 50, 50);
    centerView.autoresizingMask = YES;
    centerView.tag = 1001;
    [view1 addSubview:centerView];
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor redColor];
    topView.frame = CGRectMake(10, 10, 30, 30);
    topView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleBottomMargin|
    UIViewAutoresizingFlexibleWidth|
    UIViewAutoresizingFlexibleHeight;
    [centerView addSubview:topView];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    addBtn.frame = CGRectMake(50, height/2 - rect.size.height + 75, 100, 40);
    addBtn.backgroundColor = [UIColor whiteColor];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [addBtn setTitle:@"变大" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    UIButton *subBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    subBtn.frame = CGRectMake(200, height / 2 - rect.size.height + 70, 100, 40);
    subBtn.backgroundColor = [UIColor whiteColor];
    subBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [subBtn setTitle:@"减小" forState:UIControlStateNormal];
    [subBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [subBtn addTarget:self action:@selector(labelBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:subBtn];
}

- (void)addClick {
    UIView *view = [self.view viewWithTag:1001];
    view.frame = CGRectMake(view.frame.origin.x - 5, view.frame.origin.y - 5, view.frame.size.width+10, view.frame.size.height+10);
}

- (void)subClick {
    UIView *view = [self.view viewWithTag:1001];
    view.frame = CGRectMake(view.frame.origin.x + 5, view.frame.origin.y + 5, view.frame.size.width - 10, view.frame.size.height - 10);
}

- (void)labelBtn {
    [self presentViewController:[[BaseViewController alloc] init] animated:TRUE completion:^{
        NSLog(@"go to HomeViewController");
    }];
}

- (void)getAlter {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"警告" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击警告");
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;//重新设置代理
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;//本页面不能右滑
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
