# XYYUIKit

##说明(当前最新版本1.0.3)

    构建常用的控件，方便使用。比如button,label等
  
##使用方法

    UILabel *myLabel = [UILabel labelTextColor:[UIColor redColor] fontSize:20];
    myLabel.frame = CGRectMake(100, 100, 200, 44);
    myLabel.text = @"中国共产党万岁!!!";
    [self.view addSubview:myLabel];
    
    UIButton *myButton = [UIButton buttonWithText:@"按钮点击" 
                                        textColor:[UIColor blueColor] 
                                     textFontSize:15   
                                           action:@selector(buttonClick:) 
                                           target:self];
    myButton.frame = CGRectMake(100, 200, 160, 44);
    [self.view addSubview:myButton];
    
    UIButton *newButton = [UIButton buttonWithImageName:@"ui" action:@selector(buttonClickNew:) target:self];
    newButton.frame = CGRectMake(100, 300, 160, 44);
    [self.view addSubview:newButton];
    
##pod使用

    pod 'XYYUIKit', '~> 1.0.3'
   
    ~~pod 'XYYUIKit', '~> 1.0.0'
   
   
