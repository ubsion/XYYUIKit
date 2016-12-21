//
//  HotBannerCollectionView.m
//  AskBrotherApp
//
//  Created by xuyong on 16/12/13.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import "HotBannerCollectionView.h"
#import "HotBannerCell.h"

static NSInteger const maxUrls = 5;

static CGFloat const spaceFix = 50;

static NSString *CellIdentifier = @"XNLoopBannerViewCell";

@interface HotBannerCollectionView()<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, copy) NSArray *urls;
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic) BOOL useCustomPageControlFrame;

@property(nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property(nonatomic, strong) UICollectionView *collectionView;

@property (strong, nonatomic) UIScrollView *invisibleScrollView;//内置滚动


@end

@implementation HotBannerCollectionView

#pragma mark - Life Cycle
- (void)dealloc {
    self.collectionView.dataSource = nil;
    self.collectionView.delegate = nil;
    
}

- (instancetype)initWithFrame:(CGRect)frame imageUrls:(NSArray *)imageUrls {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        
        self.collectionView.collectionViewLayout = self.flowLayout;
        
        self.collectionView.frame = CGRectMake(0, 10, self.bounds.size.width , self.bounds.size.height - 30);
        
        self.flowLayout.itemSize = self.frame.size;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    if (self.useCustomPageControlFrame) {
//        self.pageControl.frame = self.pageControlFrame;
//    } else {
//        self.pageControl.frame = CGRectMake(0, self.frame.size.height - 22, self.frame.size.width, 22);
//    }
//    
    [self setCurrentPage:self.currentPage ? self.currentPage : 0 animated:NO];
    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.urls.count <= 1) {
        return self.urls.count;
    }
    
    if ([_urls count] < maxUrls){
        //少于5个
        return self.urls.count;

    }else
    {
        return 6;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor redColor];
    }else if (indexPath.row == 1)
    {
        cell.backgroundColor = [UIColor grayColor];
    }else if (indexPath.row == 2)
    {
        cell.backgroundColor = [UIColor blueColor];

    }else if (indexPath.row == 3)
    {
        cell.backgroundColor = [UIColor blackColor];
    }else if (indexPath.row == 4)
    {
        cell.backgroundColor = [UIColor brownColor];
    }else
    {
        cell.backgroundColor = [UIColor greenColor];
    }
    
    return cell;
}

//配置每个item的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    return CGSizeMake(SCREEN_WIDTH - spaceFix, 150 - 30);
    
    if ([_urls count] < maxUrls){
        //少于5个
       return CGSizeMake(SCREEN_WIDTH - spaceFix, 150 - 30);
        
    }else
    {
        //5个或者5个多
        if (indexPath.row >= [_urls count] ) {
            return CGSizeMake(50, 150 - 30);
        }else
        {
            return CGSizeMake(SCREEN_WIDTH - spaceFix, 150 - 30);
        }
    }
    return CGSizeMake(SCREEN_WIDTH - spaceFix, 150 - 30);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if ([self.bannerDelegate respondsToSelector:@selector(bannerView:didSelectAtIndex:)]) {
        [self.bannerDelegate bannerView:self didSelectAtIndex:self.currentPage];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.invisibleScrollView)
    {
        CGFloat pageWidth = _invisibleScrollView.frame.size.width;
        int page = floor((_invisibleScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        
        if ([_urls count] < maxUrls){
            //少于5行
            if (page >= [_urls count] - 1) {
                _collectionView.contentOffset = CGPointMake(_invisibleScrollView.contentOffset.x - spaceFix, _invisibleScrollView.contentOffset.y);
            }else
            {
                _collectionView.contentOffset = _invisibleScrollView.contentOffset;
            }
        }else
        {
            _collectionView.contentOffset = _invisibleScrollView.contentOffset;
        }
        
        self.currentPage = page;
        self.pageControl.currentPage = self.currentPage;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    [self pauseTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    [self continueTimerLater];
}



- (void)reloadWithImageUrls:(NSArray *)imageUrls {
    
    self.urls = [imageUrls copy];
    
    [self setup];
    
    //设置内置滚动条
    self.invisibleScrollView.contentSize = CGSizeMake((SCREEN_WIDTH - spaceFix) * [imageUrls count], 0);

    [self.collectionView reloadData];
}

#pragma mark - Getters && Setters
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[HotBannerCell class]
            forCellWithReuseIdentifier:CellIdentifier];
        
        
        [self addSubview:_collectionView];

        _invisibleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH - spaceFix ,  150)];
        _invisibleScrollView.backgroundColor = [UIColor clearColor];
//                _invisibleScrollView.alpha = 0.5f;
        _invisibleScrollView.delegate = self;
        _invisibleScrollView.showsHorizontalScrollIndicator = NO;
        _invisibleScrollView.showsVerticalScrollIndicator = NO;
        _invisibleScrollView.pagingEnabled = YES;
        _invisibleScrollView.userInteractionEnabled = NO;
        _invisibleScrollView.scrollsToTop = NO;
        _invisibleScrollView.bounces = YES;
        
        [_collectionView addGestureRecognizer:self.invisibleScrollView.panGestureRecognizer];
        
        [self addSubview:_invisibleScrollView];
        
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}

#pragma mark - pageControl

- (SMPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[SMPageControl alloc] init];
        _pageControl.frame = CGRectMake(0, self.frame.size.height - 22, self.frame.size.width, 22);
        _pageControl.backgroundColor =[UIColor blueColor];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.minHeight = 22;
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.pageIndicatorImage = [UIImage imageNamed:@"dot_pageIndicator"];
        _pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"dot_checked"];
        
        [_pageControl addTarget:self action:@selector(spacePageControl:) forControlEvents:UIControlEventValueChanged];

        
        [self addSubview:self.pageControl];
        
    }
    return _pageControl;
}

- (void)setCurrentPage:(NSInteger)currentPage animated:(BOOL)animated {
    _currentPage = currentPage;
    
    if (self.urls.count > 1) {
        [self.collectionView setContentOffset:CGPointMake((currentPage + 1) * self.collectionView.frame.size.width, 0) animated:animated];
    }
}

- (void)spacePageControl:(SMPageControl *)sender
{
//    NSLog(@"Current Page (SMPageControl): %li", (long)sender.currentPage);
    [self setCurrentPage:sender.currentPage animated:YES];
}

- (void)setup {
    self.pageControl.numberOfPages = self.urls.count;
    self.pageControl.currentPage = 0;
    [self setCurrentPage:0 animated:NO];
}

@end
