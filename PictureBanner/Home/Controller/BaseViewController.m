//
//  BaseViewController.m
//  PictureBanner
//
//  Created by super on 2018/4/10.
//  Copyright © 2018年 super. All rights reserved.
//

#import "BaseViewController.h"
#import "ViewDeck.h"
#import "MyWebView.h"
#import "MJExtension.h"
#import "ContentModel.h"
#import "AFNetworking.h"
#import "ListDataModel.h"
#import "MBProgressHUD.h"
#import "DKNightVersion.h"
//#import "MyRefreshFooter.h"
//#import "MyRefreshHeader.h"
//#import "AboutZhiHuDailyViewController.h"

@interface BaseViewController ()

@property (strong, nonatomic)MyWebView *webView;
@property (strong, nonatomic)DKNightVersionManager *nightVersionManager;
@property (strong, nonatomic)NSMutableArray<ListDataModel*> *listDataModels;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect frame = [[UIScreen mainScreen]bounds];
    frame.size.height = frame.size.height-59;
    self.view.frame = frame;
    
    self.webView = [[MyWebView alloc]init];
    self.webView.frame = self.view.frame;
    self.webView.delegate = self;
    
    [self.view addSubview:self.webView];
    
    [self setLeftItem];
//    [self setTitleView];
//    [self setUpRefresh];
//    [self LoadAccordingToDate];
//    
//    [self.view addMaskingLayer:self.webView.scrollView Tag:8888];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

-(void)setLeftItem{
    
//    UIBarButtonItem *leftButtom = [UIBarButtonItem initWithLetfItem:@"Nav_Open" highlightedImage:@"Nav_Open_Highlight" action:self targer:@selector(openLeftView)];
//    UIBarButtonItem *leftButtom = [[UIBarButtonItem alloc]initwith]
//    self.navigationItem.leftBarButtonItem = leftButtom;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)type {
    return @"";
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
