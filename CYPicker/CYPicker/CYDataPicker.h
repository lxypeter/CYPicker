//
//  CYDataPicker.h
//  100Days
//
//  Created by Peter Lee on 16/9/27.
//  Copyright © 2016年 CY.Lee. All rights reserved.
//

#import "CYBasePicker.h"

typedef void(^CYDataMultiSelectedBlock)(NSArray *selectedValues,NSArray *selectedIndexs);
typedef void(^CYDataSingleSelectedBlock)(NSString *selectedValue,NSInteger selectedIndex);

typedef NS_ENUM(NSUInteger, CYDataPickerType) {
    CYDataPickerTypeSingleSelect,
    CYDataPickerTypeMultiSelect
};

@interface CYDataPicker : CYBasePicker

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, assign) CYDataPickerType dataPickerType;
@property (nonatomic, copy) CYDataMultiSelectedBlock dataMultiSelectedBlock;
@property (nonatomic, copy) CYDataSingleSelectedBlock dataSingleSelectedBlock;

+ (instancetype)dataPickerWithType:(CYDataPickerType)dataPickerType dataSource:(NSArray *)dataSource;

/**
 *  显示Picker并选中项（单选）
 */
- (void)showPickerWithSelectedRow:(NSInteger)row;

/**
 *  显示Picker并选中项（多选）
 */
- (void)showPickerWithSelectedRows:(NSArray *)selectedIndexs;


@end
