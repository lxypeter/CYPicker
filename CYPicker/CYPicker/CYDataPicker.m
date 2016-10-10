//
//  CYDataPicker.m
//  100Days
//
//  Created by Peter Lee on 16/9/27.
//  Copyright © 2016年 CY.Lee. All rights reserved.
//

#import "CYDataPicker.h"

@interface CYDataPicker ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *dataPickerView;

@end

@implementation CYDataPicker

#pragma mark - 初始化
+ (instancetype)dataPickerWithType:(CYDataPickerType)dataPickerType dataSource:(NSArray *)dataSource{
    CYDataPicker *picker = [[CYDataPicker alloc] init];
    picker.dataPickerType = dataPickerType;
    picker.dataSource = dataSource;
    return picker;
}

- (void)addSubViewOfContentView{
    self.dataPickerView = [[UIPickerView alloc]initWithFrame:self.contentView.bounds];
    self.dataPickerView.dataSource = self;
    self.dataPickerView.delegate = self;
    [self.contentView addSubview:self.dataPickerView];
}

- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    if (self.dataPickerView) {
        [self.dataPickerView reloadAllComponents];
    }
}

#pragma mark - 点击事件
- (void)clickConfirmBtn{
    [super clickConfirmBtn];
    
    switch (self.dataPickerType) {
        case CYDataPickerTypeSingleSelect:{
            
            if (self.dataSingleSelectedBlock) {
                NSInteger selectedIndex = [self.dataPickerView selectedRowInComponent:0];
                NSString *selectedValue;
                if (selectedIndex != -1) {
                    selectedValue = self.dataSource[selectedIndex];
                }
                self.dataSingleSelectedBlock(selectedValue,selectedIndex);
            }
            
            break;
        }
        case CYDataPickerTypeMultiSelect:{
            
            if (self.dataMultiSelectedBlock) {
                NSMutableArray *selectedValues = [NSMutableArray array];
                NSMutableArray *selectedIndexs = [NSMutableArray array];
                [self.dataSource enumerateObjectsUsingBlock:^(NSArray *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSInteger selectedIndex = [self.dataPickerView selectedRowInComponent:idx];
                    NSString *selectedValue = @"";
                    if (selectedIndex != -1) {
                        selectedValue = self.dataSource[idx][selectedIndex];
                    }
                    [selectedIndexs addObject:@(selectedIndex)];
                    [selectedValues addObject:selectedValue];
                }];
                
                self.dataMultiSelectedBlock([selectedValues copy],[selectedIndexs copy]);
            }
            
            break;
        }
    }
}

- (void)showPickerWithSelectedRow:(NSInteger)row{
    switch (self.dataPickerType) {
        case CYDataPickerTypeSingleSelect:{
            [self.dataPickerView selectRow:row inComponent:0 animated:YES];
            break;
        }
        case CYDataPickerTypeMultiSelect:{
            break;
        }
    }
    [self showPicker];
}

- (void)showPickerWithSelectedRows:(NSArray *)selectedIndexs{
    switch (self.dataPickerType) {
        case CYDataPickerTypeSingleSelect:{
            
            break;
        }
        case CYDataPickerTypeMultiSelect:{
            [selectedIndexs enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSInteger selectedRow = [obj integerValue];
                [self.dataPickerView selectRow:selectedRow inComponent:idx animated:YES];
            }];
            break;
        }
    }
    [self showPicker];
}

#pragma mark - UIPickerView 代理
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    switch (self.dataPickerType) {
        case CYDataPickerTypeSingleSelect:{
            return 1;
        }
        case CYDataPickerTypeMultiSelect:{
            return self.dataSource.count;
        }
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (self.dataPickerType) {
        case CYDataPickerTypeSingleSelect:{
            return self.dataSource.count;
        }
        case CYDataPickerTypeMultiSelect:{
            NSArray *componentSource = self.dataSource[component];
            return componentSource.count;
        }
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title;
    switch (self.dataPickerType) {
        case CYDataPickerTypeSingleSelect:{
            title = self.dataSource[row];
            break;
        }
        case CYDataPickerTypeMultiSelect:{
            NSArray *componentSource = self.dataSource[component];
            title = componentSource[row];
            break;
        }
    }
    
    if (title && [title isKindOfClass:[NSString class]]) {
        return title;
    }
    
    return @"";
}

@end
