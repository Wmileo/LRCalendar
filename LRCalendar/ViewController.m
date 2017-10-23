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
#import "LRCWeekTitleView.h"
#import <UIScrollView+Load.h>

@interface ViewController () <LRCMonthViewDelegate, LRCMonthViewDelegate, LRCWeekTitleViewDataSource, UITableViewDelegate, UITableViewDataSource, LoadControllerDelegate>


@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *firDates;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firDates = @[[LRCalendarTool firstDateInMonthForDate:[NSDate date]]];
    
    LRCWeekTitleView *titleView = [[LRCWeekTitleView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 50)];
    titleView.dataSource = self;
    [self.view addSubview:titleView];
    [titleView reloadData];
    
    [self.view addSubview:self.tableView];

    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)lrcClickDateView:(LRCDateView *)dateView withWeekView:(LRCWeekView *)weekView{
    NSLog(@"%zd",dateView.dateComponents.day);
}

-(CGFloat)lrcWeekViewHeightWithMonthView:(LRCMonthView *)monthView{
    return 50;
}

-(UIView *)lrcHeaderViewWithMonthView:(LRCMonthView *)monthView reuseView:(UIView *)view{
    UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30)];
    NSDateComponents *com = [LRCalendarTool dateComponentsWithDate:monthView.firstDate];
    CGFloat width = CGRectGetWidth(monthView.frame) / 7;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width * (com.weekday - 1), 0, width, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%zd月",com.month];
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

-(void)lrcWeekTitleWithDay:(NSInteger)day initLabel:(UILabel *)label{
    label.text = [self days][day];
    label.textAlignment = NSTextAlignmentCenter;
}

-(NSArray *)days{
    return @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
}

#pragma mark -

-(void)loadTopFinish:(void (^)(CGFloat))finish withScrollView:(UIScrollView *)scrollView{
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self.firDates];
    NSDate *date = [LRCalendarTool firstDateInLastMonthForDate:self.firDates.firstObject];
    [arr insertObject:date atIndex:0];
    self.firDates = arr;
    LRCMonthView *monthView = [[LRCMonthView alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.frame), 10)];
    monthView.delegate = self;
    monthView.firstDate = date;
    [self.tableView reloadData];
    NSLog(@"top%f",monthView.totalHeight + 50);

    finish(monthView.totalHeight + 50);

}

-(void)loadBottomFinish:(void (^)())finish withScrollView:(UIScrollView *)scrollView{
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self.firDates];
    NSDate *date = [LRCalendarTool firstDateInNextMonthForDate:self.firDates.lastObject];
    [arr addObject:date];
    self.firDates = arr;
    LRCMonthView *monthView = [[LRCMonthView alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.frame), 10)];
    monthView.delegate = self;
    monthView.firstDate = date;
    [self.tableView reloadData];

    finish();

}

#pragma mark - tableview delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.firDates.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LRCMonthView *monthView = [[LRCMonthView alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.frame), 10)];
    monthView.delegate = self;
    monthView.firstDate = self.firDates[indexPath.row];
    NSLog(@"cell%f",monthView.totalHeight + 50);
    return monthView.totalHeight + 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"id";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        LRCMonthView *monthView = [[LRCMonthView alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.frame), 10)];
        monthView.delegate = self;
        monthView.tag = 100;
        [cell addSubview:monthView];
    }
    LRCMonthView *monthView = [cell viewWithTag:100];
    monthView.firstDate = self.firDates[indexPath.row];
    [monthView reloadData];
    
    return cell;
}

#pragma mark - set get

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 50)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.estimatedRowHeight = 80.0f;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.loadTopView = [self aloadView];
        _tableView.loadBottomView = [self aloadView];
        _tableView.loadDelegate = self;

    }
    return _tableView;
    
}

-(LoadView *)aloadView{
    LoadView *view = [[LoadView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 600)];
    view.canAutoLoad = YES;
    view.recoverDelay = 0.01;
    view.recoverDuration = 0.01;
    return view;
}

@end
