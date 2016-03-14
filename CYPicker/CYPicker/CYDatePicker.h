//
//  CYDatePicker.h
//  CYPicker
//
//  Created by Peter Lee on 16/3/10.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "CYBasePicker.h"

@class CYDatePickerView;
@protocol CYDatePickerDelgate <NSObject>

-(void)datePicker:(UIDatePicker *)dpView confirmSelectedDate:(NSDate *)selectedDate;

@end

@interface CYDatePicker : CYBasePicker

@property (strong, nonatomic) UIDatePicker *datePicker;

@property (assign, nonatomic) UIDatePickerMode datePickerMode;

@property (strong, nonatomic) id<CYDatePickerDelgate> delegate;

@property (strong, nonatomic) NSDate *currentDate;


+(instancetype)datePickerWithDelegate:(id<CYDatePickerDelgate>)delegate;

/**
 *  显示Picker并设定当前选中时间
 */
-(void)showPickerByDate:(NSDate *)date;

@end
