//
//  CommonUIVIewController.m
//  PictureBanner
//
//  Created by super on 2018/4/17.
//  Copyright © 2018年 super. All rights reserved.
//

#import "CommonUIVIewController.h"

@interface CommonUIVIewController ()

@end

@implementation CommonUIVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(200, 100, 90, 35);
    [button setTitle:@"enter" forState:UIControlStateNormal];
    [button setTitle:@"cancel" forState:UIControlStateHighlighted];
    [button setBackgroundColor:UIColor.greenColor];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(getAlter) forControlEvents:UIControlEventTouchUpInside];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
