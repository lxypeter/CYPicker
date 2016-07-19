//
//  CYBasePicker.m
//  CYPicker
//
//  Created by Peter Lee on 16/3/10.
//  Copyright © 2016年 Peter Lee. All rights reserved.
//

#import "CYBasePicker.h"

@implementation CYBasePicker

#pragma mark - 懒加载
- (UIButton *)maskButton{
    if (!_maskButton) {
        _maskButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _maskButton.backgroundColor = [UIColor blackColor];
        _maskButton.alpha = 0.3;
        _maskButton.hidden = YES;
        [_maskButton addTarget:self action:@selector(clickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _maskButton;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self setBaseContentView];
        
    }
    return self;
}

#pragma mark 生成Picker内控件
- (void)setBaseContentView{
    
    self.frame = CGRectMake(0, ScreenHeight, ScreenWidth, kPickerHeight);
    
    //背景及边框颜色
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 0.5;
    UIColor *borderColor = [self colorFromHexString:@"#CDCDCD"];
    self.layer.borderColor = borderColor.CGColor;
    
    //Picker工具条
    self.toolBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    self.toolBarView.layer.borderWidth = 0.5;
    self.toolBarView.layer.borderColor = borderColor.CGColor;
    
    [self addSubview:self.toolBarView];
    
    //工具条按钮
    CGFloat border = 15;
    CGFloat btnWidth = 50;
    
    self.confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-border - btnWidth, 0, btnWidth, self.toolBarView.frame.size.height)];
    [self.confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.confirmBtn setTitleColor:[self colorFromHexString:@"#000000"] forState:UIControlStateNormal];
    [self.confirmBtn addTarget:self action:@selector(clickConfirmBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.toolBarView addSubview:self.confirmBtn];
    
    self.cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 0, 50, self.toolBarView.frame.size.height)];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[self colorFromHexString:@"#000000"] forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(clickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.toolBarView addSubview:self.cancelBtn];
    
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.toolBarView.frame), ScreenWidth, self.frame.size.height - CGRectGetMaxY(self.toolBarView.frame))];
    [self addSubview:self.contentView];
    
}

- (void)clickConfirmBtn{
    [self hidePicker];
}

- (void)clickCancelBtn{
    [self hidePicker];
}

#pragma mark - 显示/隐藏Picker
- (void)showPicker{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.maskButton];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [self.maskButton setHidden:NO];
    [self setHidden:NO];
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect temFrame = self.frame;
        
        temFrame.origin.y = ScreenHeight-kPickerHeight;
        
        self.frame = temFrame;
    }];
}

- (void)hidePicker{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect temFrame = self.frame;
        temFrame.origin.y = ScreenHeight;
        self.frame = temFrame;
    } completion:^(BOOL finished) {
        [self setHidden:YES];
        [self.maskButton setHidden:YES];
    }];
    
    [self.maskButton removeFromSuperview];
    [self removeFromSuperview];
}

#pragma mark - 设置按钮文字及颜色
- (void)setConfirmBtnTitle:(NSString *)title Color:(UIColor *)titleColor{

    if(title&&[title stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]].length!=0){
        [self.confirmBtn setTitle:title forState:UIControlStateNormal];
    }
    
    if (titleColor) {
        [self.confirmBtn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
}

-(void)setCancelBtnTitle:(NSString *)title Color:(UIColor *)titleColor{
    
    if(title&&[title stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]].length!=0){
        [self.cancelBtn setTitle:title forState:UIControlStateNormal];
    }
    
    if (titleColor) {
        [self.cancelBtn setTitleColor:titleColor forState:UIControlStateNormal];
    }
}

#pragma mark - 辅助方法
- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
