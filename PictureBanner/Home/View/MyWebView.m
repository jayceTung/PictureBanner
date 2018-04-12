//
//  MyWebView.m
//  PictureBanner
//
//  Created by super on 2018/4/10.
//  Copyright © 2018年 super. All rights reserved.
//

#import "MyWebView.h"
#import "ContentModel.h"
#import "DKNightVersion.h"
#import "UIImageView+WebCache.h"

@implementation MyWebView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)setUpHeaderView:(ContentModel *)contentModel {
    
    UIImageView *headerImageView = [[UIImageView alloc]init];
    [headerImageView sd_setImageWithURL:[NSURL URLWithString:contentModel.image] placeholderImage:nil];
    headerImageView.frame = CGRectMake(0, 0, self.frame.size.width, 204);
    UIImageView *bottomMask = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Iamge_Mask"]];
    bottomMask.frame = CGRectMake(0, 100, headerImageView.frame.size.width, 104);
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = contentModel.title;
    [titleLabel setTextColor:[UIColor whiteColor]];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.frame = CGRectMake(15, 130, headerImageView.frame.size.width - 15, 50);
    
    UILabel *imageSource = [[UILabel alloc] init];
    imageSource.text = contentModel.image_source;
    [imageSource setTextColor:[UIColor whiteColor]];
    imageSource.textAlignment = NSTextAlignmentRight;
    imageSource.font = [UIFont systemFontOfSize:10];
    imageSource.frame = CGRectMake(0, 170, headerImageView.frame.size.width - 10, 20);
    
    [headerImageView addSubview:bottomMask];
    [headerImageView addSubview:titleLabel];
    [headerImageView addSubview:imageSource];
    [headerImageView addSubview:headerImageView];
    [headerImageView addSubview:headerImageView];
//    self.scrollView.dk_backgroundColorPicker = DKColorPickerWithColors(Ref);
    NSString *htmlString = contentModel.body;
    
    [self loadHTMLString:htmlString baseURL:nil];
    [self setBackgroundColor: [UIColor whiteColor]];
    
}

@end
