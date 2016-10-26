//
//  CYMutipleStringPicker.h
//  CYPicker
//
//  Created by Peter Lee on 2016/10/26.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "CYBasePicker.h"

typedef void(^CYDataMultiSelectedBlock)(NSArray *selectedValues,NSArray *selectedIndexs);

@interface CYMutipleStringPicker : CYBasePicker

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, copy) CYDataMultiSelectedBlock dataMultiSelectedBlock;

+ (instancetype)dataPickerWithDataSource:(NSArray *)dataSource selectedBlock:(CYDataMultiSelectedBlock)dataMultiSelectedBlock;

/**
 *  显示Picker并选中项（多选）
 */
- (void)showPickerWithSelectedRows:(NSArray *)selectedIndexs;

@end
