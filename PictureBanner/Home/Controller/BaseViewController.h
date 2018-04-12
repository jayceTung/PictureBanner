//
//  BaseViewController.h
//  PictureBanner
//
//  Created by super on 2018/4/10.
//  Copyright © 2018年 super. All rights reserved.
//

#import "ViewController.h"

@interface BaseViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) NSData *datanow;
- (NSString *) type;

@end
