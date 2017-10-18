//
//  LRCWeekView.m
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "LRCWeekView.h"
#import "LRCalendarTool.h"

@interface LRCWeekView()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *,LRCDateView *> *dateViews;

@end

@implementation LRCWeekView

-(void)reloadData{
    if (self.dataSource && self.firstDate && self.monthFirstDate) {
        CGFloat width = self.frame.size.width / 7;
        CGFloat height = self.frame.size.height;
        NSInteger max = 7;
        for (int i = 0; i < max; i++) {
            NSDateComponents *components = [LRCalendarTool dateComponentsWithDate:[LRCalendarTool dateFromDate:self.firstDate afterDays:i]];
            LRCDateView *reuse = self.dateViews[@(i)];
            [reuse removeFromSuperview];
            LRCDateView *dateView = [self.dataSource lrcDateViewWithDateComponents:components inWeekView:self reuseDateView:reuse];
            if (dateView) {
                dateView.frame = CGRectMake(width * i, 0, width - 1, height);
                self.dateViews[@(i)] = dateView;
                [self addSubview:dateView];
            }
        }
    }
}

-(NSMutableDictionary<NSNumber *,LRCDateView *> *)dateViews{
    if (!_dateViews) {
        _dateViews = [NSMutableDictionary dictionaryWithCapacity:7];
    }
    return _dateViews;
}

@end
