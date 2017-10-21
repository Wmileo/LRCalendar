//
//  LRCDayView.m
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "LRCDateView.h"

@interface LRCDateView ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation LRCDateView

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.label.frame = self.bounds;
    self.button.frame = self.bounds;
}

-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor clearColor];
        [self addSubview:_label];
    }
    return _label;
}

-(UIButton *)button{
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button addTarget:self action:@selector(clickOnButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
    }
    return _button;
}

-(void)clickOnButton{
    if (self.Click) {
        self.Click(self.dateComponents);
    }
}

@end
