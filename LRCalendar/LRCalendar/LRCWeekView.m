//
//  LRCWeekView.m
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "LRCWeekView.h"
#import "LRCalendarTool.h"

@implementation LRCWeekView

-(void)reloadData{
    if (self.dataSource && self.firstDate && self.monthFirstDate) {
        CGFloat width = self.frame.size.width / 7;
        CGFloat height = self.frame.size.height;
        NSInteger max = 7;
        for (int i = 0; i < max; i++) {
            NSDateComponents *components = [LRCalendarTool componentsWithDate:[LRCalendarTool dateFromDate:self.firstDate afterDays:i]];
            LRCDateView *dateView = [self.dataSource lrcDateViewWithDateComponents:components inWeekView:self];
            dateView.frame = CGRectMake(width * i, 0, width - 1, height);
            NSInteger tag = i + 1;
            dateView.tag = tag;
            [[self viewWithTag:tag] removeFromSuperview];
            [self addSubview:dateView];
        }
    }
}

@end
