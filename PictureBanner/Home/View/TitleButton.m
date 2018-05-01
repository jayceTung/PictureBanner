//
//  TitleButton.m
//  PictureBanner
//
//  Created by super on 2018/4/26.
//  Copyright © 2018年 super. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.backgroundColor = [UIColor grayColor];
    }
    
    return self;
}
@end
