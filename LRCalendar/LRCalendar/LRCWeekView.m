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
    if (self.delegate && self.firstDate && self.monthFirstDate) {
        CGFloat width = self.frame.size.width / 7;
        CGFloat height = self.frame.size.height;
        NSInteger max = 7;
        for (int i = 0; i < max; i++) {
            NSDate *date = [LRCalendarTool dateFromDate:self.firstDate afterDays:i];
            NSDateComponents *components = [LRCalendarTool dateComponentsWithDate:date];
            LRCDateView *reuse = self.dateViews[@(i)];
            [reuse removeFromSuperview];
            LRCDateView *dateView = [self.delegate lrcDateViewWithDateComponents:components inWeekView:self reuseDateView:reuse];
            dateView.date = date;
            __weak LRCDateView *wDateView = dateView;
            dateView.Click = ^(NSDateComponents *dateComponents) {
                __strong LRCDateView *sDateView = wDateView;
                [self.delegate lrcClickDateView:sDateView withWeekView:self];
            };
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
