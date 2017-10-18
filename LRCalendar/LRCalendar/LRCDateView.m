//
//  LRCDayView.m
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "LRCDateView.h"

@implementation LRCDateView

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.label.frame = self.bounds;
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

@end
