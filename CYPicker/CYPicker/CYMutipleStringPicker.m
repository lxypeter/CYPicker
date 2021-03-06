//
//  CYMutipleStringPicker.m
//  CYPicker
//
//  Created by Peter Lee on 2016/10/26.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "CYMutipleStringPicker.h"

@interface CYMutipleStringPicker ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *dataPickerView;

@end

@implementation CYMutipleStringPicker

#pragma mark - 初始化
+ (instancetype)dataPickerWithDataSource:(NSArray *)dataSource selectedBlock:(CYDataMultiSelectedBlock)dataMultiSelectedBlock{
    CYMutipleStringPicker *picker = [[CYMutipleStringPicker alloc] init];
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
}

- (void)showPickerWithSelectedRows:(NSArray *)selectedIndexs{

    [selectedIndexs enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger selectedRow = [obj integerValue];
        [self.dataPickerView selectRow:selectedRow inComponent:idx animated:YES];
    }];
    
    [self showPicker];
}

#pragma mark - UIPickerView 代理
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.dataSource.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *componentSource = self.dataSource[component];
    return componentSource.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    NSArray *componentSource = self.dataSource[component];
    NSString *title = componentSource[row];
    
    if (title && [title isKindOfClass:[NSString class]]) {
        return title;
    }
    
    return @"";
}

@end
