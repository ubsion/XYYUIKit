//
//  HotBannerCollectionView.h
//  AskBrotherApp
//
//  Created by xuyong on 16/12/13.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYYUIKit.h"
#import "SMPageControl.h"


@class HotBannerCollectionView;
@protocol HotBannerCollectionViewDelegate <NSObject>
@optional
- (void)bannerView:(HotBannerCollectionView *)bannerView didSelectAtIndex:(NSInteger)index;
@end

@interface HotBannerCollectionView : UIView
@property(nonatomic, weak) id<HotBannerCollectionViewDelegate> bannerDelegate;

@property(nonatomic, strong) SMPageControl *pageControl;
@property(nonatomic) NSInteger currentPage; //default is 0.
@property(nonatomic) BOOL autoScroll; //default is YES.
@property(nonatomic) NSTimeInterval animationDuration; //default is 3s.
@property(nonatomic, strong) UIImage *placeholderImage;

/**
 *  do NOT use ".pageControl.frame = " to change frame of pageControl. Default is CGRectMake(0,
 *  self.frame.size.height - 22, self.frame.size.width, 22).
 */
@property(nonatomic) CGRect pageControlFrame;

//  object in "imageUrls" must be kind of NSString or NSURL class"
- (instancetype)initWithFrame:(CGRect)frame imageUrls:(NSArray *)imageUrls;
- (void)reloadWithImageUrls:(NSArray *)imageUrls;


@end
