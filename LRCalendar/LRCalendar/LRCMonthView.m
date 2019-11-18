//
//  LRCMonthView.m
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "LRCMonthView.h"
#import "LRCalendarTool.h"

@interface LRCMonthView () {
    NSInteger _weekNum;
}

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, LRCWeekView *> *weekViews;

@end

@implementation LRCMonthView


-(void)reloadData{
    if (self.delegate && self.firstDate) {
        [self.headerView removeFromSuperview];
        UIView *headerView = [self.delegate lrcHeaderViewWithMonthView:self reuseView:self.headerView];
        CGFloat top = 0;
        if (headerView) {
            headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(headerView.frame));
            self.headerView = headerView;
            [self addSubview:self.headerView];
            top += CGRectGetHeight(headerView.frame);
        }
        NSInteger wnum = self.weekNum;
        CGFloat height = [self.delegate lrcWeekViewHeightWithMonthView:self];
        for (UIView *view in [self.weekViews allValues]) {
            [view removeFromSuperview];
        }
        for (NSInteger i = 0 ; i < wnum; i++) {
            LRCWeekView *reuse = self.weekViews[@(i)];
            if (!reuse) {
                reuse = [[LRCWeekView alloc] init];
                reuse.delegate = self.delegate;
                self.weekViews[@(i)] = reuse;
            }
            reuse.frame = CGRectMake(0, top, CGRectGetWidth(self.frame), height);
            [self addSubview:reuse];
            reuse.monthFirstDate = self.firstDate;
            NSDate *date = [LRCalendarTool dateFromDate:self.firstDate afterDays:7*i];
            reuse.firstDate = [LRCalendarTool firstDateInWeekForDate:date];
            [reuse reloadData];
            top += height;
        }
        self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), top);
    }
}

#pragma mark - set get

- (void)setWeekNum:(NSInteger)weekNum{
    _weekNum = weekNum;
}

-(NSInteger)weekNum{
    if (_weekNum > 0) {
        return _weekNum;
    }
    return [LRCalendarTool weeksCountInMonthForDate:self.firstDate];
}

-(NSDateComponents *)firstDateComponents{
    return [LRCalendarTool dateComponentsWithDate:self.firstDate];
}

-(CGFloat)totalHeight{
    CGFloat height = self.weekNum * [self.delegate lrcWeekViewHeightWithMonthView:self];
    UIView *headerView = [self.delegate lrcHeaderViewWithMonthView:self reuseView:self.headerView];
    if (headerView) {
        self.headerView = headerView;
        height += headerView.frame.size.height;
    }
    return height;
}

-(NSMutableDictionary<NSNumber *,LRCWeekView *> *)weekViews{
    if (!_weekViews) {
        _weekViews = [NSMutableDictionary dictionaryWithCapacity:6];
    }
    return _weekViews;
}

@end
