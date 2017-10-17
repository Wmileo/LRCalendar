//
//  LRCDayView.h
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRCDateView : UIView

@property (nonatomic, strong) NSDateComponents *dateComponents;
@property (nonatomic, copy) void (^Click)(NSDateComponents *dateComponents);

@end
