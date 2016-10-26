# CYPicker
选择栏的简单封装，包含日期选择，单选多选

##使用方法
  *通用方法
```
/**
*  设置确定按钮文字及颜色
*
*  @param title
*  @param titleColor 
*/
-(void)setConfirmBtnTitle:(NSString *)title Color:(UIColor *)titleColor;

/**
*  设置取消按钮文字及颜色
*
*  @param title
*  @param titleColor
*/
-(void)setCancelBtnTitle:(NSString *)title Color:(UIColor *)titleColor;

/**
*  显示Picker
*/
-(void)showPicker;

/**
*  隐藏Picker
*/
-(void)hidePicker;
```

  *CYDatePicker
```
CYDatePicker *cyDatePicker = [CYDatePicker datePickerWithDateSelectedBlock:^(NSDate *selectedDate) {
    //选中事件
}];
```

  *CYSingleStringPicker
```
CYSingleStringPicker *cyDataSinglePicker = [CYSingleStringPicker dataPickerWithDataSource:@[@"选项1",@"选项2",@"选项3"] selectedBlock:^(NSString *selectedValue, NSInteger selectedIndex) {
    //选中事件
}];
```
