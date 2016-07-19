//
//  CYBasePicker.h
//  CYPicker
//
//  Created by Peter Lee on 16/3/10.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define kPickerHeight ScreenHeight * 0.4

@interface CYBasePicker : UIView

@property (strong, nonatomic) UIView *toolBarView;

@property (strong, nonatomic) UIView *contentView;

@property (strong, nonatomic) UIButton *confirmBtn;

@property (strong, nonatomic) UIButton *cancelBtn;

@property (strong, nonatomic) UIButton *maskButton;

/**
 *  设置确定按钮文字及颜色
 *
 *  @param title
 *  @param titleColor 
 */
- (void)setConfirmBtnTitle:(NSString *)title Color:(UIColor *)titleColor;

/**
 *  设置取消按钮文字及颜色
 *
 *  @param title
 *  @param titleColor
 */
- (void)setCancelBtnTitle:(NSString *)title Color:(UIColor *)titleColor;

/**
 *  显示Picker
 */
- (void)showPicker;

/**
 *  隐藏Picker
 */
- (void)hidePicker;

/**
 *  点击确定按钮
 */
- (void)clickConfirmBtn;

/**
 *  点击取消按钮
 */
- (void)clickCancelBtn;
@end
