//
//  LRCalendarTool.m
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "LRCalendarTool.h"

@implementation LRCalendarTool
+(NSCalendar *)calendar{
    return [NSCalendar currentCalendar];
}

+(BOOL)isSameDayWithDate1:(NSDate *)date1 date2:(NSDate *)date2{
    return [[self calendar] isDate:date1 inSameDayAsDate:date2];
}

+(BOOL)isSameMonthWithDate1:(NSDate *)date1 date2:(NSDate *)date2{
    return [[self calendar] isDate:date1 equalToDate:date2 toUnitGranularity:NSCalendarUnitMonth];
}

+(BOOL)isTodayWithDate:(NSDate *)date{
    return [[self calendar] isDateInToday:date];
}

+(BOOL)isDate1:(NSDate *)date1 laterThanDate2:(NSDate *)date2{
    return [date1 laterDate:date2] == date1;
}

+(NSDate *)firstDayInWeekForDate:(NSDate *)date{
    NSDate *day;
    if (![[self calendar] rangeOfUnit:NSCalendarUnitWeekOfMonth startDate:&day interval:NULL forDate:date]){
    }
    return day;
}

+(NSDate *)firstDayInLastWeekForDate:(NSDate *)date{
    NSDate *sunday = [self firstDayInWeekForDate:date];
    return [self dateFromDate:sunday beforeDays:7];
}

+(NSDate *)firstDayInNextWeekForDate:(NSDate *)date{
    NSDate *sunday = [self firstDayInWeekForDate:date];
    return [self dateFromDate:sunday afterDays:7];
}

+(NSDate *)firstDayInMonthForDate:(NSDate *)date{
    NSDate *firstDay;
    if (![[self calendar] rangeOfUnit:NSCalendarUnitMonth startDate:&firstDay interval:NULL forDate:date]){
    }
    return firstDay;
}

+(NSDate *)firstDayInLastMonthForDate:(NSDate *)date{
    NSDate *firstDay = [self firstDayInMonthForDate:date];
    return [self firstDayInMonthForDate:[self dateFromDate:firstDay beforeDays:1]];
}

+(NSDate *)firstDayInNextMonthForDate:(NSDate *)date{
    NSDate *firstDay = [self firstDayInMonthForDate:date];
    return [self firstDayInMonthForDate:[self dateFromDate:firstDay afterDays:31]];
}

+(NSInteger)weeksCountInMonthForDate:(NSDate *)date{
    NSRange range = [[self calendar] rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

+(NSInteger)daysCountInMonthForDate:(NSDate *)date{
    NSRange range = [[self calendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

+(NSInteger)daysFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    if (fromDate && toDate) {
        NSDateComponents * dayComponents = [[self calendar]components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
        return dayComponents.day;
    }
    return 0;
}

+(NSDateComponents *)componentsWithDate:(NSDate *)date{
    return [[self calendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitWeekOfMonth|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:date];
}

+(NSDate *)dateFromDate:(NSDate *)date afterDays:(NSInteger)days{
    return [[NSDate alloc] initWithTimeInterval:days * 86400 sinceDate:date];
}

+(NSDate *)dateFromDate:(NSDate *)date beforeDays:(NSInteger)days{
    return [[NSDate alloc] initWithTimeInterval:days * -86400 sinceDate:date];
}

@end
