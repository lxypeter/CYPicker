//
//  CYSingleStringPicker.h
//  CYPicker
//
//  Created by Peter Lee on 2016/10/26.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "CYBasePicker.h"

typedef void(^CYDataSingleSelectedBlock)(NSString *selectedValue,NSInteger selectedIndex);

@interface CYSingleStringPicker : CYBasePicker

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, copy) CYDataSingleSelectedBlock dataSingleSelectedBlock;

+ (instancetype)dataPickerWithDataSource:(NSArray *)dataSource selectedBlock:(CYDataSingleSelectedBlock)dataSingleSelectedBlock;

/**
 *  显示Picker并选中项（单选）
 */
- (void)showPickerWithSelectedRow:(NSInteger)row;

@end
