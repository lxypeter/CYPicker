//
//  CYDataPicker.h
//  CYPicker
//
//  Created by Peter Lee on 16/3/11.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "CYBasePicker.h"

@protocol CYDataSinglePickerDelgate <NSObject>

- (void)dataSinglePicker:(UIPickerView *)dpView confirmSelectedValue:(NSString *)selectedValue andSelectedIndex:(NSInteger)selectedIndex;

@end

@interface CYDataSinglePicker : CYBasePicker

@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) NSString *selectedValue;
@property (nonatomic,assign) NSInteger selectedIndex;
@property (weak, nonatomic) id<CYDataSinglePickerDelgate> delegate;

+ (instancetype)dataPickerWithDataSource:(NSArray *)dataSource andDelegate:(id<CYDataSinglePickerDelgate>)delegate;

@end
