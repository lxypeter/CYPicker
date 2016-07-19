//
//  CYDataPicker.m
//  CYPicker
//
//  Created by Peter Lee on 16/3/11.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "CYDataSinglePicker.h"

@interface CYDataSinglePicker ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) UIPickerView *dataPicker;

@end

@implementation CYDataSinglePicker

#pragma mark - 初始化
+ (instancetype)dataPickerWithDataSource:(NSArray *)dataSource andDelegate:(id<CYDataSinglePickerDelgate>)delegate{
    CYDataSinglePicker *picker = [[CYDataSinglePicker alloc] init];
    picker.dataSource = dataSource;
    picker.delegate = delegate;
    return picker;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addSubViewOfContentView];
    }
    return self;
}

- (void)addSubViewOfContentView{
    //UIPickerView
    self.dataPicker = [[UIPickerView alloc]initWithFrame:self.contentView.bounds];
    self.dataPicker.dataSource = self;
    self.dataPicker.delegate = self;
    
    [self.contentView addSubview:self.dataPicker];
}

- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    if (self.dataPicker) {
        [self.dataPicker reloadAllComponents];
    }
}


#pragma mark - 点击事件
- (void)clickConfirmBtn{
    [super clickConfirmBtn];
    [self.delegate dataSinglePicker:self.dataPicker confirmSelectedValue:self.selectedValue andSelectedIndex:self.selectedIndex];
}

#pragma mark - UIPickerView 代理
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataSource.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title = self.dataSource[row];
    
    if (title && [title isKindOfClass:[NSString class]]) {
        return title;
    }
    
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectedIndex=row;
    self.selectedValue=self.dataSource[row];
}

@end
