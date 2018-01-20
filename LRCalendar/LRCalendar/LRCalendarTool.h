//
//  LRCalendarTool.h
//  LRCalendar
//
//  Created by leo on 2017/10/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRCalendarTool : NSObject

+(BOOL)isTodayWithDate:(NSDate *)date;//是否今天
+(BOOL)isSameDateWithDate1:(NSDate *)date1 date2:(NSDate *)date2;//是否同一天
+(BOOL)isSameMonthWithDate1:(NSDate *)date1 date2:(NSDate *)date2;//是否同一个月
+(BOOL)isSameWeekWithDate1:(NSDate *)date1 date2:(NSDate *)date2;//是否同一周
+(BOOL)isDate1:(NSDate *)date1 laterThanDate2:(NSDate *)date2;

+(NSDate *)firstDateInWeekForDate:(NSDate *)date;//date的当前周第一天 （周日）
+(NSDate *)firstDateInLastWeekForDate:(NSDate *)date;//上一周
+(NSDate *)firstDateInNextWeekForDate:(NSDate *)date;//下一周

+(NSDate *)firstDateInMonthForDate:(NSDate *)date;//date的当前月第一天 （一号）
+(NSDate *)firstDateInLastMonthForDate:(NSDate *)date;//上一月
+(NSDate *)firstDateInNextMonthForDate:(NSDate *)date;//下一月

+(NSInteger)weeksCountInMonthForDate:(NSDate *)date;//date的当前月的周数
+(NSInteger)daysCountInMonthForDate:(NSDate *)date;//date的当前月的天数
+(NSInteger)weekNumInMonthForDate:(NSDate *)date;//date的当前月的第几周
+(NSDateComponents *)dateComponentsWithDate:(NSDate *)date;

//从某天到某天间隔多少天
+(NSInteger)daysCountFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

+(NSDate *)dateFromDate:(NSDate *)date afterDays:(NSInteger)days;
+(NSDate *)dateFromDate:(NSDate *)date beforeDays:(NSInteger)days;
         
@end
