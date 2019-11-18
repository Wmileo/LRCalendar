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

@protocol LRCMonthViewDelegate <LRCWeekViewDelegate>

-(CGFloat)lrcWeekViewHeightWithMonthView:(LRCMonthView *)monthView;
-(UIView *)lrcHeaderViewWithMonthView:(LRCMonthView *)monthView reuseView:(UIView *)view;

@end

@interface LRCMonthView : UIView

@property (nonatomic, weak) id<LRCMonthViewDelegate> delegate;

@property (nonatomic, strong) NSDate *firstDate;

@property (nonatomic, assign) NSInteger weekNum; //要展示的周数，默认该月总周数
@property (nonatomic, readonly) NSDateComponents *firstDateComponents;

@property (nonatomic, readonly) CGFloat totalHeight;
-(void)reloadData;

@end
