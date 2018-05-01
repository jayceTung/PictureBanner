//
//  CustomCell.m
//  PictureBanner
//
//  Created by super on 2018/4/13.
//  Copyright © 2018年 super. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.lable];
        self.lable.text = @"水电费第三方发送到";
        [self.contentView addSubview:self.textFileld];
    }
    return self;
}

- (UILabel *)lable {
    if (!_lable) {
        _lable = [[UILabel alloc]init];
        _lable.frame = CGRectMake(120, 0, 500, 50);
    }
    return _lable;
}

- (UITextField *)textFileld {
    if (_textFileld) {
        _textFileld = [[UITextField alloc]init];
        _textFileld.frame = CGRectMake(120, 0, 200, 50);
    }
    return _textFileld;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
