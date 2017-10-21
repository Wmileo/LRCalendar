//
//  LRCWeekTitleView.m
//  LRCalendar
//
//  Created by leo on 2017/10/20.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "LRCWeekTitleView.h"

@interface LRCWeekTitleView ()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *,UILabel *> *labels;

@end

@implementation LRCWeekTitleView

-(void)reloadData{
    if (self.dataSource) {
        CGFloat width = self.frame.size.width / 7;
        CGFloat height = self.frame.size.height;
        NSInteger max = 7;
        for (int i = 0; i < max; i++) {
            UILabel *reuse = self.labels[@(i)];
            if (!reuse) {
                reuse = [[UILabel alloc] initWithFrame:CGRectMake(width * i, 0, width - 1, height)];
                self.labels[@(i)] = reuse;
                [self addSubview:reuse];
            }
            [self.dataSource lrcWeekTitleWithDay:i initLabel:reuse];
        }
    }
}

@end
