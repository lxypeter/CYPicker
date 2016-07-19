//
//  ViewController.m
//  CYPicker
//
//  Created by Peter Lee on 16/3/10.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "ViewController.h"
#import "CYPicker.h"

@interface ViewController () <CYDatePickerDelgate,CYDataSinglePickerDelgate>

@property (nonatomic,strong) CYDatePicker *cyDatePicker;
@property (nonatomic,strong) CYDataSinglePicker *cyDataSinglePicker;
@property (nonatomic,strong) NSDateFormatter *formatter;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *singleDataLabel;

@end

@implementation ViewController

#pragma mark - 懒加载
- (CYDatePicker *)cyDatePicker{
    if (!_cyDatePicker) {
        _cyDatePicker = [CYDatePicker datePickerWithDelegate:self];
//        _cyDatePicker.datePickerMode = UIDatePickerModeDate;
    }
    return _cyDatePicker;
}

- (CYDataSinglePicker *)cyDataSinglePicker{
    if (!_cyDataSinglePicker) {
        _cyDataSinglePicker = [CYDataSinglePicker dataPickerWithDataSource:@[@"选项1",@"选项2",@"选项3"] andDelegate:self];
    }
    return _cyDataSinglePicker;
}

- (NSDateFormatter *)formatter{
    if(!_formatter){
        _formatter = [[NSDateFormatter alloc]init];
        _formatter.dateFormat = @"YYYY-MM-dd";
    }
    return _formatter;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 显示控件
- (IBAction)showDatePicker:(id)sender {
    [self.cyDatePicker showPicker];
}

- (IBAction)showDataSinglePicker:(id)sender {
    [self.cyDataSinglePicker showPicker];
}

#pragma mark - 代理方法
- (void)datePicker:(UIDatePicker *)dpView confirmSelectedDate:(NSDate *)selectedDate{
    NSString *dateString = [self.formatter stringFromDate:selectedDate];
    self.dateLabel.text = dateString;
}

- (void)dataSinglePicker:(UIPickerView *)dpView confirmSelectedValue:(NSString *)selectedValue andSelectedIndex:(NSInteger)selectedIndex{
    
    NSString *result = [NSString stringWithFormat:@"选中第%li项，【%@】",selectedIndex,selectedValue];
    
    self.singleDataLabel.text = result;
}

@end
