//
//  LRCWeekTitleView.h
//  LRCalendar
//
//  Created by leo on 2017/10/20.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRCWeekTitleViewDataSource <NSObject>

//0为周日
-(void)lrcWeekTitleWithDay:(NSInteger)day initLabel:(UILabel *)label;

@end


@interface LRCWeekTitleView : UIView

@property (nonatomic, weak) id<LRCWeekTitleViewDataSource> dataSource;

-(void)reloadData;

@end
