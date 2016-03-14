//
//  CYDatePicker.m
//  CYPicker
//
//  Created by Peter Lee on 16/3/10.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "CYDatePicker.h"

@interface CYDatePicker ()

@end

@implementation CYDatePicker

+(instancetype)datePickerWithDelegate:(id<CYDatePickerDelgate>)delegate{
    CYDatePicker *dataPicker = [[CYDatePicker alloc]init];
    dataPicker.delegate = delegate;
    return dataPicker;
}

#pragma mark - 初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubViewOfContentView];
    }
    return self;
}

- (void)addSubViewOfContentView{
    //UIDatePicker
    self.datePicker = [[UIDatePicker alloc]initWithFrame:self.contentView.bounds];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    [self.contentView addSubview:self.datePicker];
}


#pragma mark - 点击确定
-(void)clickConfirmBtn{
    [super clickConfirmBtn];
    [self.delegate datePicker:self.datePicker confirmSelectedDate:self.currentDate];
}

#pragma mark - 简便方法
/**
 *  当前选中时间
 */
-(NSDate *)currentDate{
    _currentDate = self.datePicker.date;
    return _currentDate;
}

-(void)setDatePickerMode:(UIDatePickerMode)datePickerMode{
    _datePickerMode = datePickerMode;
    self.datePicker.datePickerMode = datePickerMode;
}

-(void)showPickerByDate:(NSDate *)date{
    [super showPicker];
    [self.datePicker setDate:date];
}
@end
