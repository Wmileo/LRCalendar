//
//  LRCWeekView.h
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRCDateView.h"

@class LRCWeekView;

@protocol LRCWeekViewDelegate <NSObject>

-(void)lrcClickDateView:(LRCDateView *)dateView withWeekView:(LRCWeekView *)weekView;

-(LRCDateView *)lrcDateViewWithDateComponents:(NSDateComponents *)dateComponents inWeekView:(LRCWeekView *)weekView reuseDateView:(LRCDateView *)dateView;

@end

@interface LRCWeekView : UIView

@property (nonatomic, weak) id<LRCWeekViewDelegate> delegate;

@property (nonatomic, strong) NSDate *monthFirstDate;
@property (nonatomic, strong) NSDate *firstDate;

-(void)reloadData;

@end
