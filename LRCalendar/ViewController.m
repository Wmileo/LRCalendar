//
//  ViewController.m
//  LRCalendar
//
//  Created by leo on 2017/10/16.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "ViewController.h"
#import "LRCMonthView.h"
#import "LRCalendarTool.h"

@interface ViewController () <LRCMonthViewDelegate, LRCMonthViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LRCMonthView *monthView = [[LRCMonthView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 10)];
    monthView.firstDate = [LRCalendarTool firstDateInMonthForDate:[LRCalendarTool dateFromDate:[NSDate date] beforeDays:18]];
    monthView.delegate = self;
    monthView.dataSource = self;
    [self.view addSubview:monthView];
    [monthView reloadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)lrcClickDateView:(LRCDateView *)dateView withMonthView:(LRCMonthView *)monthView{
    
}

-(CGFloat)lrcWeekViewHeightWithMonthView:(LRCMonthView *)monthView{
    return 50;
}

-(UIView *)lrcHeaderViewWithMonthView:(LRCMonthView *)monthView reuseView:(UIView *)view{
    UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30)];
    aview.backgroundColor = [UIColor redColor];
    NSDateComponents *com = [LRCalendarTool dateComponentsWithDate:monthView.firstDate];
    CGFloat width = CGRectGetWidth(monthView.frame) / 7;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width * (com.weekday - 1), 0, width, 30)];
    label.text = [NSString stringWithFormat:@"%zd",com.month];
    [aview addSubview:label];
    return aview;
}

-(LRCDateView *)lrcDateViewWithDateComponents:(NSDateComponents *)dateComponents inWeekView:(LRCWeekView *)weekView reuseDateView:(LRCDateView *)dateView{
    if (!dateView) {
        dateView = [[LRCDateView alloc] init];
    }
    dateView.dateComponents = dateComponents;
    dateView.label.text = [NSString stringWithFormat:@"%zd",dateComponents.day];
    return dateView;
}

@end
