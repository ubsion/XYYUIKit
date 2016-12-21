//
//  ViewController.m
//  XYYUIKit
//
//  Created by xuyong on 16/12/2.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import "ViewController.h"

#import "XYYUIKit.h"
#import "HotBannerCollectionView.h"


@interface ViewController ()<HotBannerCollectionViewDelegate>
@property(nonatomic, strong) HotBannerCollectionView *bannerView;
@property(nonatomic, copy)   NSArray          *imageUrls;

@property (nonatomic,strong) NSMutableArray   *bannerListArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.view addSubview:self.bannerView];

    [_bannerView reloadWithImageUrls:@[@1,@1,@1,@1]];

    
    
    
//    UILabel *myLabel = [UILabel labelTextColor:[UIColor redColor] fontSize:20];
//    myLabel.frame = CGRectMake(100, 100, 200, 44);
//    myLabel.text = @"中国共产党万岁!!!";
//    [self.view addSubview:myLabel];
//    
//    
//    UIButton *myButton = [UIButton buttonWithText:@"按钮点击" textColor:[UIColor blueColor] textFontSize:15 action:@selector(buttonClick:) target:self];
//    myButton.frame = CGRectMake(100, 200, 160, 44);
//    [self.view addSubview:myButton];
//    
//    UIButton *newButton = [UIButton buttonWithImageName:@"ui" action:@selector(buttonClickNew:) target:self];
//    newButton.frame = CGRectMake(100, 300, 160, 44);
//    [self.view addSubview:newButton];
}

#pragma mark - getter/setter

- (HotBannerCollectionView *)bannerView {
    if (!_bannerView) {
        _bannerView = [[HotBannerCollectionView alloc] initWithFrame:(CGRect){0,0,SCREEN_WIDTH,150} imageUrls:self.imageUrls];
        _bannerView.bannerDelegate = self;
        _bannerView.placeholderImage = [UIImage imageNamed:@"bannar_default"];
    }
    return _bannerView;
}

#pragma mark - XNLoopBannerViewDelegate
-(void)bannerView:(HotBannerCollectionView *)bannerView didSelectAtIndex:(NSInteger)index {
    
    
    //    BroadWebView *web = [[BroadWebView alloc] init];
    //    web.loadUrl = actionUrl;
    //    [self.navigationController pushViewController:web animated:YES];
    //    BannerModel *model = self.bannerListArray[index];
    //    NSString *actionUrl = model.actionUrl;
    //    if ([_delegate respondsToSelector:@selector(bannerHeaderView:didSelectAtIndex:)]) {
    //        [_delegate bannerHeaderView:actionUrl didSelectAtIndex:index];
    //    }
    
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
