//
//  CYSingleStringPicker.m
//  CYPicker
//
//  Created by Peter Lee on 2016/10/26.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "CYSingleStringPicker.h"

@interface CYSingleStringPicker ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *dataPickerView;

@end

@implementation CYSingleStringPicker

#pragma mark - 初始化
+ (instancetype)dataPickerWithDataSource:(NSArray *)dataSource selectedBlock:(CYDataSingleSelectedBlock)dataSingleSelectedBlock{
    CYSingleStringPicker *picker = [[CYSingleStringPicker alloc] init];
    picker.dataSource = dataSource;
    picker.dataSingleSelectedBlock = dataSingleSelectedBlock;
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

    if (self.dataSingleSelectedBlock) {
        NSInteger selectedIndex = [self.dataPickerView selectedRowInComponent:0];
        NSString *selectedValue;
        if (selectedIndex != -1) {
            selectedValue = self.dataSource[selectedIndex];
        }
        self.dataSingleSelectedBlock(selectedValue,selectedIndex);
    }
}

- (void)showPickerWithSelectedRow:(NSInteger)row{
    [self.dataPickerView selectRow:row inComponent:0 animated:YES];
    [self showPicker];
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
@end
