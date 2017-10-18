//
//  LRCMonthView.h
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRCDateView.h"
#import "LRCWeekView.h"

@class LRCMonthView;

@protocol LRCMonthViewDelegate <NSObject>

-(void)lrcClickDateView:(LRCDateView *)dateView withMonthView:(LRCMonthView *)monthView;

@end

@protocol LRCMonthViewDataSource <LRCWeekViewDataSource>

-(CGFloat)lrcWeekViewHeightWithMonthView:(LRCMonthView *)monthView;
-(UIView *)lrcHeaderViewWithMonthView:(LRCMonthView *)monthView reuseView:(UIView *)view;

@end

@interface LRCMonthView : UIView

@property (nonatomic, weak) id<LRCMonthViewDelegate> delegate;
@property (nonatomic, weak) id<LRCMonthViewDataSource> dataSource;

@property (nonatomic, strong) NSDate *firstDate;

@property (nonatomic, readonly) NSInteger weekNum;
@property (nonatomic, readonly) NSDateComponents *firstDateComponents;

@property (nonatomic, readonly) CGFloat totalHeight;
-(void)reloadData;

@end
