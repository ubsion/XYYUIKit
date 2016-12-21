//
//  UITextView+XYYTextView.h
//  AskBrotherApp
//
//  Created by xuyong on 16/12/15.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (XYYTextView)<UITextViewDelegate>

@property (nonatomic,assign) NSInteger limiteNumber;
@property (nonatomic,strong) NSString *placeholderText;

@property (nonatomic,strong) NSString *readayPlaceholderText;

/**
 TextView

 @param placeholderText 阴影
 @param fontSize 字体大小
 @param textColor 字体颜色
 @param placeholderColor 阴影颜色
 @return
 */
-(UITextView *)textViewPlaceholderText:(NSString *)placeholderText
                              fontSize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                      placeholderColor:(UIColor *)placeholderColor;

@end
