//
//  ViewController.m
//  XYYUIKit
//
//  Created by xuyong on 16/12/2.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import "ViewController.h"

#import "XYYUIKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *myLabel = [UILabel labelTextColor:[UIColor redColor] fontSize:20];
    myLabel.frame = CGRectMake(100, 100, 200, 44);
    myLabel.text = @"中国共产党万岁!!!";
    [self.view addSubview:myLabel];
    
    
    UIButton *myButton = [UIButton buttonWithText:@"按钮点击" textColor:[UIColor blueColor] textFontSize:15 action:@selector(buttonClick:) target:self];
    myButton.frame = CGRectMake(100, 200, 160, 44);
    [self.view addSubview:myButton];
    
    UIButton *newButton = [UIButton buttonWithImageName:@"ui" action:@selector(buttonClickNew:) target:self];
    newButton.frame = CGRectMake(100, 300, 160, 44);
    [self.view addSubview:newButton];
}


-(void)buttonClick:(UIButton *)button
{
    NSLog(@"buttonClick");
}


-(void)buttonClickNew:(UIButton *)button
{
    NSLog(@"buttonNewClick");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
