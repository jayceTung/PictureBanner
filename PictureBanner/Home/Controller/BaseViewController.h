//
//  BaseViewController.h
//  PictureBanner
//
//  Created by super on 2018/4/10.
//  Copyright © 2018年 super. All rights reserved.
//

#import "ViewController.h"
#import "TitleButton.h"

@interface BaseViewController : ViewController

/**
 *  当前Controller的标题
 *
 *  @return 标题
 */
-(NSString *)controllerTitle;

/**
 *  初始化View
 */
-(void)initView;

/**
 *  按钮操作区的数组元素
 *
 *  @return 数组
 */
-(NSArray *)operateTitleArray;

-(void)clickBtn : (UIButton *)btn;

@end
