//
//  HotBannerCell.m
//  AskBrotherApp
//
//  Created by xuyong on 16/12/13.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import "HotBannerCell.h"



@implementation HotBannerCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.contentView.frame;
}

@end

