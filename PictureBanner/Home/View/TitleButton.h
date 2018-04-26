//
//  TitleButton.h
//  PictureBanner
//
//  Created by super on 2018/4/26.
//  Copyright © 2018年 super. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleButton : UIButton

/**
 *  初始化按钮
 *
 *  @param frame frame
 *  @param title 标题
 *
 *  @return 按钮对象
 */
-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title;

@end
