//
//  ViewController.m
//  CYPicker
//
//  Created by Peter Lee on 16/3/10.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "ViewController.h"
#import "CYPicker.h"

@interface ViewController ()

@property (nonatomic,strong) CYDatePicker *cyDatePicker;
@property (nonatomic,strong) CYDataPicker *cyDataSinglePicker;
@property (nonatomic,strong) NSDateFormatter *formatter;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *singleDataLabel;

@end

@implementation ViewController

#pragma mark - 懒加载
- (CYDatePicker *)cyDatePicker{
    if (!_cyDatePicker) {
        _cyDatePicker = [CYDatePicker datePickerWithDateSelectedBlock:^(NSDate *selectedDate) {
            NSString *dateString = [self.formatter stringFromDate:selectedDate];
            self.dateLabel.text = dateString;
        }];
//        _cyDatePicker.datePickerMode = UIDatePickerModeDate;
    }
    return _cyDatePicker;
}

- (CYDataPicker *)cyDataSinglePicker{
    if (!_cyDataSinglePicker) {
        _cyDataSinglePicker = [CYDataPicker dataPickerWithType:CYDataPickerTypeSingleSelect dataSource:@[@"选项1",@"选项2",@"选项3"]];
        __weak typeof(self) weakSelf = self;
        _cyDataSinglePicker.dataSingleSelectedBlock = ^(NSString *selectedValue,NSInteger selectedIndex){
            NSString *result = [NSString stringWithFormat:@"选中第%li项，【%@】",selectedIndex,selectedValue];
            weakSelf.singleDataLabel.text = result;
        };
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

@end
