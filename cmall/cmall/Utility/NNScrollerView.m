//
//  NNScrollerView.m
//  cmall
//
//  Created by ddpisces on 15/8/5.
//  Copyright (c) 2015年 NAONAO. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "NNScrollerView.h"

@implementation NNScrollerView

@synthesize delegate;

- (instancetype)initWithFrameRect:(CGRect)rect scrolArray:(NSArray *)array needTitile:(BOOL)isNeedTitle
{
    NSUInteger pageCount = array.count;
    _showArray = [NSArray arrayWithArray:array];
    linkArray  = [[NSMutableArray alloc] init];
    NSMutableArray *imagePathArray = [[NSMutableArray alloc] init];

    if ((self = [super initWithFrame:rect]))
    {
        for(NSInteger i = 0; i < array.count; i++) {
            NSDictionary *dic = [array objectAtIndex:i];
            [imagePathArray addObject:[dic objectForKey:@"image"]];
            [linkArray addObject:[dic objectForKey:@"link"]];
        }
        
        self.userInteractionEnabled = YES;
        viewSize = rect;
        
        scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, viewSize.size.width, viewSize.size.height)];
        scrollView.pagingEnabled = YES;
        scrollView.contentSize = CGSizeMake(viewSize.size.width * pageCount, viewSize.size.height);
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.scrollsToTop = NO;
        scrollView.delegate = self;
        scrollView.backgroundColor = [UIColor clearColor];
        
        for (int i = 0; i < pageCount; i++)
        {
            UIImageView *imgView = [[UIImageView alloc] init];
            imgView.contentMode = UIViewContentModeScaleToFill;
            imgView.backgroundColor = [UIColor grayColor];
            imgView.userInteractionEnabled = YES;
            imgView.tag= i;
            [imgView setFrame:CGRectMake(viewSize.size.width*i, 0,viewSize.size.width, viewSize.size.height)];
            
            [imgView sd_setImageWithURL:[NSURL URLWithString:imagePathArray[i]] placeholderImage:[UIImage imageNamed:@"default_01.png"]];
            
            UITapGestureRecognizer *Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)];
            [imgView addGestureRecognizer:Tap];
            
            [scrollView addSubview:imgView];
        }
        
        [self addSubview:scrollView];
        
        float pageControlWidth = pageCount * 10;
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(320-pageControlWidth-20,scrollView.frame.size.height-15,pageControlWidth,10)];
        pageControl.currentPage = 0;
        
        if (pageCount > 1) {
            pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        }else{
            pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        }

        pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        pageControl.numberOfPages = pageCount;
        
        [self addSubview:scrollView];
        [self addSubview:pageControl];
    }

    return self;
}

- (void) updateScrollView
{
    [NSTimer scheduledTimerWithTimeInterval:2 target:self
                                   selector:@selector(handleMaxShowTimer:)
                                   userInfo: nil
                                    repeats:YES];
}

- (void)handleMaxShowTimer:(NSTimer*)theTimer
{
    CGPoint pt = scrollView.contentOffset;
    NSInteger count = [imageArray count];
    if(pt.x == viewSize.size.width * (count-2))
    {
        [scrollView setContentOffset:CGPointMake(viewSize.size.width, 0)];
        [scrollView scrollRectToVisible:CGRectMake(viewSize.size.width,0,viewSize.size.width,viewSize.size.height) animated:YES];
    }else{
        [scrollView scrollRectToVisible:CGRectMake(pt.x+viewSize.size.width,0,viewSize.size.width,viewSize.size.height) animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    currentPageIndex=page;
    pageControl.currentPage=page;
}

- (void)imagePressed:(UITapGestureRecognizer *)sender
{
    if ([delegate respondsToSelector:@selector(NNScrollerViewDidClicked:)]) {
        [delegate NNScrollerViewDidClicked:sender.view.tag];
    }
}

@end

